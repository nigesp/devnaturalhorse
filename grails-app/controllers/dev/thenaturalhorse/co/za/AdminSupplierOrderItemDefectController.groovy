package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class AdminSupplierOrderItemDefectController {

    def create() {
        SupplierOrderItem orderItem = SupplierOrderItem.findById(params?.id)

        if (!orderItem) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        if (orderItem?.supplyOrder?.state != SupplyOrderState.RECEIVED) {
            flash.message = message(code: 'supplierOrder.wrong.state', args: [orderItem?.supplyOrder?.id, 'RECEIVED', 'register any defective order items'])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminSupplierOrder', action: 'show', id: orderItem?.supplyOrder?.id)
            return
        }

        render(view: '/admin/supplierOrderItemReject/create', model: [supplierOrderItemInstance: orderItem])
    }
}
