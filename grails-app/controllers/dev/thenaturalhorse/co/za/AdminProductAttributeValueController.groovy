package dev.thenaturalhorse.co.za

class AdminProductAttributeValueController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def create() {
        def productAttribute = ProductAttribute.findById(params?.id)

        render(view: '/admin/productAttributeValue/create', model: [productAttributeInstance: productAttribute])
    }

    def save() {
        def productAttribute = ProductAttribute.findById(params?.productAttributeId)

        def productAttributeValueInstance = new ProductAttributeValue()
        productAttributeValueInstance.value = params?.value
        productAttributeValueInstance.productAttribute = productAttribute

        productAttributeValueInstance.validate()

        if (productAttributeValueInstance.hasErrors()) {
            render(view: "/admin/productAttributeValue/create", model: [productAttributeValueInstance: productAttributeValueInstance, productAttributeInstance: productAttribute])
            return
        }

        productAttribute.addToValues(productAttributeValueInstance)
        productAttribute.save(flush: true)

        redirect(controller: 'adminProduct', action: "show", id: productAttribute?.product?.id)
    }

    def edit() {
        def productAttribute = ProductAttribute.findById(params?.productAttributeId)
        def productAttributeValueInstance = ProductAttributeValue.get(params.id)

        if (!productAttributeValueInstance) {
            redirect(controller: 'adminProduct', action: 'show', id: productAttribute?.product?.id)
            return
        }

        render(view: '/admin/productAttributeValue/edit', model:  [productAttributeValueInstance: productAttributeValueInstance, productAttributeInstance: productAttribute])
    }

    def update() {
        def productAttribute = ProductAttribute.findById(params?.productAttributeId)
        def productAttributeValueInstance = ProductAttributeValue.get(params.id)

        if (!productAttributeValueInstance) {
            redirect(controller: 'adminProduct', action: 'show', id: productAttribute?.product?.id)
            return
        }

        productAttributeValueInstance.properties = params

        if (!productAttributeValueInstance.save(flush: true)) {
            render(view: "/admin/productAttributeValue/edit", model: [productAttributeValueInstance: productAttributeValueInstance, productAttributeInstance: productAttribute])
            return
        }

        redirect(controller: 'adminProduct', action: 'show', id: productAttribute?.product?.id)
    }
}
