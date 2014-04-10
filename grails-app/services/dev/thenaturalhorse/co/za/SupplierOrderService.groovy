package dev.thenaturalhorse.co.za

class SupplierOrderService {

    def String createOrderNumber(Supplier supplier) {
        int numOrders = 0
        for(SupplierOrder order : supplier?.supplierOrders) {
            if(!order.parentOrder) {
                numOrders++
            }
        }

        //Add 1 for new order:
        numOrders++
        def strNumOrders

        if(numOrders < 10) {
            strNumOrders = "00" + numOrders
        } else if(numOrders < 100) {
            strNumOrders = "0" + numOrders
        } else {
            strNumOrders = "" + numOrders
        }

        return supplier?.supplierCode + strNumOrders
    }

    def boolean allItemsProcessed(SupplierOrder order) {
        boolean allProcessed = true
        order.items.each {
            if(!it.processed) {
                allProcessed = false
            }
        }

        return allProcessed
    }
}
