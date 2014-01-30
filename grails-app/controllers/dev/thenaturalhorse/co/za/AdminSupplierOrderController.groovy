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


}
