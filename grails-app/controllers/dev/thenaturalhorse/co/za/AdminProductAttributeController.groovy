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
        render(view: '/admin/productAttribute/create', model: [productAttributeInstance: new ProductAttribute(params), productInstance: Product.findById(params?.productId)])
    }

    def save = { ProductAttributeCommand attributeCommand ->

        if (attributeCommand.hasErrors()) {
            attributeCommand.each {
                println(it)
            }
            render(view: '/admin/productAttribute/create', model: [attributeCommand: attributeCommand])
            return
        }

        ProductAttributeValue value = new ProductAttributeValue()
        value.setValue(attributeCommand?.defaultValue)

        ProductAttribute attribute = new ProductAttribute()
        attribute.setName(attributeCommand?.name)
        attribute.addToProductAttributeValues(value)

        Product product = Product.findById(attributeCommand?.product?.id)
        product.addToProductAttributes(attribute)
        product.save(flush: true)

        redirect(controller: "adminProduct", action: "show", id: "${attributeCommand?.product?.id}")
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
        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        [productAttributeInstance: productAttributeInstance]
    }

    def update() {
        def productAttributeInstance = ProductAttribute.get(params.id)
        if (!productAttributeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productAttributeInstance.version > version) {
                productAttributeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'productAttribute.label', default: 'ProductAttribute')] as Object[],
                        "Another user has updated this ProductAttribute while you were editing")
                render(view: "edit", model: [productAttributeInstance: productAttributeInstance])
                return
            }
        }

        productAttributeInstance.properties = params

        if (!productAttributeInstance.save(flush: true)) {
            render(view: "edit", model: [productAttributeInstance: productAttributeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productAttribute.label', default: 'ProductAttribute'), productAttributeInstance.id])
        redirect(action: "show", id: productAttributeInstance.id)
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

    class ProductAttributeCommand {
        String name
        String defaultValue
        Product product

        static constraints = {
            name(nullable: false, blank: false)
            defaultValue(nullable: false, blank: false)
            product(nullable: false)
        }
    }
}
