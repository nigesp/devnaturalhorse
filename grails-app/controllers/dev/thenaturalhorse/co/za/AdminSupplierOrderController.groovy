package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class AdminSupplierOrderController {

    def list() {
        render(view: '/admin/supplierOrder/list', model: [supplierOrderList: SupplierOrder.findAll()])
    }

    def show() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        render(view: '/admin/supplierOrder/show', model: [supplierOrderInstance: order])
    }

    def create() {
        Supplier supplierInstance = Supplier.findById(params?.id)

        SupplierOrder order = new SupplierOrder()
        order.supplier = supplierInstance
        order.state = SupplyOrderState.OPEN
        order.total = 0.00

        supplierInstance.addToSupplyOrders(order)

        supplierInstance.save(flush: true)

        redirect(action: 'show', id: order?.id)
    }

    def addProductForm() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        if(order.state != SupplyOrderState.OPEN) {
            flash.message = message(code: 'supplierOrder.wrong.state', args: [order?.id, 'OPEN', 'add products to it'])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminSupplier', action: 'show', id: order?.supplier?.id)
            return
        }

        render(view: '/admin/supplierOrder/edit', model: [supplierOrderInstance: order, productList: order?.supplier?.products, actionName: 'addProduct'])
    }

    def addProduct() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        if(order.state != SupplyOrderState.OPEN) {
            flash.message = message(code: 'supplierOrder.wrong.state', args: [order?.id, 'OPEN', 'add products to it'])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminSupplier', action: 'show', id: order?.supplier?.id)
            return
        }

        ProductOption productOption = ProductOption?.findById(params?.productOptionId)

        SupplierOrderItem orderItem = new SupplierOrderItem()
        orderItem.numItems = params?.numItems
        orderItem.pricePerOption = params?.pricePerOption
        orderItem.productOption = productOption
        orderItem.supplyOrder = order

        orderItem.validate()

        if (orderItem.hasErrors()) {
            render(view: '/admin/supplierOrder/edit', model: [supplierOrderInstance: order, supplierOrderItemInstance: orderItem, productList: order?.supplier?.products])
            return
        }

        order.addToItems(orderItem)
        order.save(flush: true)

        redirect(action: 'show', id: order?.id)
    }

    def productOptionsForProduct() {
        Product product = Product.findById(params?.id)

        if (!product) {
            flash.message = message(code: 'default.not.found.message', args: ['Product', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        render(template: '/admin/supplierOrder/form-add-product-option', model: [productOptions: product?.productOptions])
    }

}
