package dev.thenaturalhorse.co.za

class SupplierTagLib {

    def supplierOrderTotalItems = { attr ->
        SupplierOrder order = attr?.bean

        int totalItems = 0
        order?.items.each {
            totalItems += it.numberOfApprovedItems
        }

        out << totalItems
    }

}
