package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class SupplierTagLib {

    def supplierOrderTotalItems = { attr ->
        SupplierOrder order = attr?.bean

        int totalItems = 0
        if(order.state == SupplyOrderState.PROCESSED || order.state == SupplyOrderState.PAID) {
            order?.items.each {
                totalItems += it.numberOfApprovedItems
            }
        } else {
            order?.items.each {
                totalItems += it.totalNumberOfItems
            }
        }

        out << totalItems
    }

}
