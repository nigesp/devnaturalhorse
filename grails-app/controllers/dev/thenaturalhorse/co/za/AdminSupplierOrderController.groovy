package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class AdminSupplierOrderController {

    def supplierOrderService

    def productOptionService

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
        order.orderNum = supplierOrderService.createOrderNumber(supplierInstance)
        order.state = SupplyOrderState.OPEN
        order.total = 0.00

        supplierInstance.addToSupplierOrders(order)

        supplierInstance.save(flush: true)

        redirect(action: 'show', id: order?.id)
    }

    def submitToSupplier() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        order.state = SupplyOrderState.ORDERED
        order.save(flush: true)

        render(view: '/admin/supplierOrder/show', model: [supplierOrderInstance: order])
    }

    def received() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        order.state = SupplyOrderState.RECEIVED
        order.save(flush: true)

        render(view: '/admin/supplierOrder/show', model: [supplierOrderInstance: order])
    }

    def process() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        if (!supplierOrderService.allItemsProcessed(order)) {
            flash.message = "Please process all the items in this order before processing the order."
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "show", id: order?.id)
            return
        }

        productOptionService.adProcessedItemsToStock(order)

        order.state = SupplyOrderState.PROCESSED
        order.save(flush: true)

        redirect(controller: 'adminSupplier', action: 'show', id: order?.supplier?.id)
    }
}
