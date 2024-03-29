package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def ProductImageService productImageService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        render(view: "/admin/product/list", model: [productInstanceList: Product.findAll()])
        /*params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: "/admin/product/list", model: [productInstanceList: Product.list(params), productInstanceTotal: Product.count()])*/
    }

    def create() {
        render(view: "/admin/product/create", model: [productInstance: new Product(params)])
    }

    def save() {
        def productInstance = new Product(params)

        productInstance.imageUrl = productImageService.resizeProductImage(request.getFile("productImage"), productInstance?.name?.replace(' ', '').toLowerCase())

        productInstance.validate()

        if (productInstance.hasErrors()) {
            productInstance.errors.each {
                println it
            }
            render(view: "/admin/product/create", model: [productInstance: productInstance])
            return
        }

        ProductOption productOption = new ProductOption()
        productOption.price = new BigDecimal(params?.price)
        productOption.numProducts = Integer.parseInt(params?.totalItems)

        productInstance.addToProductOptions(productOption)

        productInstance.save(flush: true)

		flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def show() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/product/show", model: [productInstance: productInstance])
    }

    def edit() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        render(view: '/admin/product/edit', model: [productInstance: productInstance])
    }

    def update() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def delete() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
