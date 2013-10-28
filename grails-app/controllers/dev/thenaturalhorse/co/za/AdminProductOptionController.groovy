package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminProductOptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
        if (!productOptionInstance.save(flush: true)) {
            render(view: "create", model: [productOptionInstance: productOptionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'productOption.label', default: 'ProductOption'), productOptionInstance.id])
        redirect(action: "show", id: productOptionInstance.id)
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
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productOption.label', default: 'ProductOption'), params.id])
            redirect(action: "list")
            return
        }

        [productOptionInstance: productOptionInstance]
    }

    def update() {
        def productOptionInstance = ProductOption.get(params.id)
        if (!productOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productOption.label', default: 'ProductOption'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productOptionInstance.version > version) {
                productOptionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'productOption.label', default: 'ProductOption')] as Object[],
                        "Another user has updated this ProductOption while you were editing")
                render(view: "edit", model: [productOptionInstance: productOptionInstance])
                return
            }
        }

        productOptionInstance.properties = params

        if (!productOptionInstance.save(flush: true)) {
            render(view: "edit", model: [productOptionInstance: productOptionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productOption.label', default: 'ProductOption'), productOptionInstance.id])
        redirect(action: "show", id: productOptionInstance.id)
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
