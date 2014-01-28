package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminProductCategoryController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: "/admin/productCategory/list", model: [productCategoryInstanceList: ProductCategory.list(params), productCategoryInstanceTotal: ProductCategory.count()])
    }

    def create() {
        render(view: "/admin/productCategory/create", model: [productCategoryInstance: new ProductCategory(params)])
    }

    def save() {
        def productCategoryInstance = new ProductCategory(params)
        if (!productCategoryInstance.save(flush: true)) {
            render(view: "/admin/productCategory/create", model: [productCategoryInstance: productCategoryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
        redirect(action: "show", id: productCategoryInstance.id)
    }

    def show() {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (!productCategoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/productCategory/show", model: [productCategoryInstance: productCategoryInstance])
    }

    def edit() {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (!productCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/productCategory/edit", model: [productCategoryInstance: productCategoryInstance])
    }

    def update() {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (!productCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])
            redirect(controller: "adminProductCategory", action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productCategoryInstance.version > version) {
                productCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productCategory.label', default: 'ProductCategory')] as Object[],
                          "Another user has updated this ProductCategory while you were editing")
                render(view: "/admin/productCategory/edit", model: [productCategoryInstance: productCategoryInstance])
                return
            }
        }

        productCategoryInstance.properties = params

        if (!productCategoryInstance.save(flush: true)) {
            render(view: "/admin/productCategory/edit", model: [productCategoryInstance: productCategoryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
        redirect(action: "show", id: productCategoryInstance.id)
    }

    def delete() {
        def productCategoryInstance = ProductCategory.get(params.id)
        def categoryName = productCategoryInstance?.name

        if (!productCategoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])
            redirect(action: "list")
            return
        }

        if (productCategoryInstance?.products?.size() > 0) {
            flash.message = message(code: 'default.not.deleted.message', args: ['Product Category', categoryName, 'This product category has products inside it.'])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        try {
            productCategoryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: ['Product Category', categoryName])
            flash.messageType = "alert-info"
            flash.messageHeading = "Success"
            redirect(action: "list")
        }

        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
