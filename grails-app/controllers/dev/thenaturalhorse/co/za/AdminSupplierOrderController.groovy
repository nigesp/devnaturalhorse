package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class AdminSupplierOrderController {

    def list() {
        render(view: '/admin/supplierOrder/list', model: [supplierOrderList: SupplierOrder.findAll()])
    }

    def create() {
        Supplier supplierInstance = Supplier.findById(params?.id)

        SupplierOrder order = new SupplierOrder()
        order.supplier = supplierInstance
        order.state = SupplyOrderState.OPEN
        order.total = 0.00

        supplierInstance.addToSupplyOrders(order)

        supplierInstance.save(flush: true)

        render(view: '/admin/supplierOrder/create', model: [supplierOrderInstance: order])
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

        render(view: '/admin/supplierOrder/edit', model: [supplierOrderInstance: order, productOptionList: ProductOption.findAllForSupplier(order?.supplier)])
    }


}
