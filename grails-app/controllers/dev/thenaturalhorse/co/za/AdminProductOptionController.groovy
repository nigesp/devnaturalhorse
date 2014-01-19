package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminProductOptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def ProductOptionService productOptionService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productOptionInstanceList: ProductOption.list(params), productOptionInstanceTotal: ProductOption.count()]
    }

    def create() {
        Product productInstance = Product.findById(params?.productId)
        render(view: '/admin/productOption/create', model: [productOptionInstance: new ProductOption(params), productInstance: productInstance])
    }

    def save() {
        def productOptionInstance = new ProductOption(params)
        Product productInstance = Product.findById(params?.productId)

        //Check that all the attributeOptions have selected values...
        def hasAttributeError = false
        params.list("attributeValueId").eachWithIndex { attrVal, idx ->
            if (attrVal.equals(-1)) {
                hasAttributeError = true
            } else {
                ProductOptionAttribute productOptionAttribute = new ProductOptionAttribute()
                def productAttributeValueInstance = ProductAttributeValue.findById(attrVal)
                productOptionAttribute.attribute = productAttributeValueInstance.productAttribute
                productOptionAttribute.value = productAttributeValueInstance

                productOptionInstance.addToProductOptionAttributes(productOptionAttribute)
            }
        }

        productOptionInstance.product = productInstance

        productOptionService.populateOptionAttributes(productOptionInstance)

        productInstance.productOptions.each {
            productOptionService.populateOptionAttributes(it)
        }

        productInstance.productOptions.each {
            if(it.optionAttributes == productOptionInstance.optionAttributes) {
                hasAttributeError = true
            }
        }

        productOptionInstance.validate()

        if (productOptionInstance.hasErrors() || hasAttributeError) {
            productOptionInstance.errors.each {
                println it
            }
            render(view: "/admin/productOption/create", model: [productOptionInstance: productOptionInstance, productInstance: productInstance, hasAttributeError: hasAttributeError])
            return
        }

        productInstance.addToProductOptions(productOptionInstance)
        productInstance.save(flush: true)

        redirect(controller: 'adminProduct', action: "show", id: productInstance.id)
    }

    def show() {
        def productOptionInstance = ProductOption.get(params.id)
        if (!productOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productOption.label', default: 'ProductOption'), params.id])
            redirect(action: "list")
            return
        }

        [productOptionInstance: productOptionInstance]
    }

    def edit() {
        def productOptionInstance = ProductOption.get(params.id)

        if (!productOptionInstance) {
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        render(view: '/admin/productOption/edit', model: [productOptionInstance: productOptionInstance])
    }

    def update() {
        def productOptionInstance = ProductOption.get(params.id)

        if (!productOptionInstance) {
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        //Set new properties on product option...
        productOptionInstance.price = new BigDecimal(params?.price)

        if (!productOptionInstance.save(flush: true)) {
            render(view: "edit", model: [productOptionInstance: productOptionInstance])
            return
        }

        redirect(controller: 'adminProduct', action: "show", id: productOptionInstance.product.id)
    }

    def delete() {
        def productOptionInstance = ProductOption.get(params.id)
        if (!productOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productOption.label', default: 'ProductOption'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productOptionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'productOption.label', default: 'ProductOption'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productOption.label', default: 'ProductOption'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
