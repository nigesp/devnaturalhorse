package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminProductAttributeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        Product product = Product.findById(params?.id)
        def productAttributeInstanceList = product?.productAttributes

        render(view: '/admin/productAttribute/list', model: [productInstance: product, productAttributeInstanceList: productAttributeInstanceList, productAttributeInstanceTotal: productAttributeInstanceList?.size()])
    }

    def create() {
        Product product = Product.findById(params?.productId)
        render(view: '/admin/productAttribute/create', model: [productAttributeInstance: new ProductAttribute(params), productInstance: product, createNewAttribute: true])
    }

    def save() {

        Product product = Product.findById(params?.productId)

        ProductAttribute productAttribute = new ProductAttribute()
        productAttribute.name = params?.name
        productAttribute.product = product
        params?.list('values').each {
            if(it != "") {
                ProductAttributeValue attributeValue = new ProductAttributeValue()
                attributeValue.value = it

                productAttribute.addToValues(attributeValue)
            }
        }

        productAttribute.validate()
        if (productAttribute.hasErrors()) {
            productAttribute.errors.each {
                println it
            }
            render(view: '/admin/productAttribute/create', model: [productAttributeInstance: productAttribute, productInstance: product, createNewAttribute: true])
            return
        }

        if (product?.productOptions?.size() > 0) {
            product.productOptions.each {
                ProductOptionAttribute productOptionAttribute = new ProductOptionAttribute()
                productOptionAttribute.attribute = productAttribute
                productOptionAttribute.value = productAttribute.values.get(0)

                it.addToProductOptionAttributes(productOptionAttribute)
            }
        } else {
            ProductOptionAttribute productOptionAttribute = new ProductOptionAttribute()
            productOptionAttribute.attribute = productAttribute.name
            productOptionAttribute.value = productAttribute.values.get(0)

            ProductOption productOption = new ProductOption()
            productOption.addToProductOptionAttributes(productOptionAttribute)
            productOption.numProducts = 0
            productOption.price = 0.0

            product.addToProductOptions(productOption)
        }

        product.addToProductAttributes(productAttribute)
        product.save(flush: true)

        redirect(controller: "adminProduct", action: "show", id: product?.id)
    }

    def show() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        [productAttributeInstance: productAttributeInstance]
    }

    def edit() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        Product product = Product?.findById(params?.productId)
        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        render(view: '/admin/productAttribute/edit', model: [productAttributeInstance: productAttributeInstance, productInstance: product, templ: params?.template])
    }

    def editAttributeValue() {
        def attributeValue = ProductAttributeValue.findById(params?.id)
        def productInstance = Product.findById(params?.productId)

        if (!attributeValue) {
            if (!productInstance) {
                redirect(controller: 'adminDashboard', action: 'index')
            } else {
                redirect(controller: "adminProduct", action: "show", id: productInstance.id)
            }
        }

        render(view: '/admin/productAttribute')
    }

    def editProductAttribute() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        Product product = Product?.findById(params?.productId)
        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        render(view: '/admin/productAttribute/edit', model: [productAttributeInstance: productAttributeInstance, productInstance: product])
    }

    def updateProductAttribute() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        Product product = Product.findById(params?.productId)

        productAttributeInstance.name = params?.name
        if (!productAttributeInstance.save(flush: true)) {
            render(view: '/admin/productAttribute/edit', model: [productAttributeInstance: productAttributeInstance, productInstance: product])
        }

        redirect(controller: "adminProduct", action: "show", id: product.id)
    }

    def update() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        Product product = Product.findById(params?.productId)

        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        //productAttributeInstance.properties = params
        productAttributeInstance.name = params?.name
        productAttributeInstance.values = new ArrayList()
        params?.list('values').each {
            if(it != "") {
                productAttributeInstance.addToValues(it)
            }
        }

        if (productAttributeInstance.hasErrors()) {
            render(view: '/admin/productAttribute/edit', model: [productAttributeInstance: productAttributeInstance, productInstance: product])
            return
        }

        product.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), productAttributeInstance.id])
        redirect(controller: "adminProduct", action: "show", id: product.id)
    }

    def delete() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productAttributeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def getProductAttributeValues() {
        def productAttribute = ProductAttribute.findById(params?.id)
        List<String> attrValues = new ArrayList<String>()
        if (productAttribute) {
            attrValues = productAttribute.values
        }
        render(template: '/admin/productOption/productOptionAttributeValuesSelect', model: [attributeValues: attrValues])
    }

    /*class ProductAttributeCommand {
        String name
        List<String> attributes
        Product product

        static constraints = {
            name(nullable: false, blank: false)
            attributes(nullable: false, minSize: 1)
            product(nullable: false)
        }
    }*/
}
