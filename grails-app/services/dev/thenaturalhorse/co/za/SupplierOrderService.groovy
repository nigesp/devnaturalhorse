package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

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

    def void createChildSupplierOrder(SupplierOrder order) {
        boolean hasRejectedItems = false
        order.items.each { orderItem ->
            if(orderItem?.numberOfRejectItems > 0) {
                hasRejectedItems = true
            }
        }

        if(hasRejectedItems) {
            SupplierOrder newOrder = new SupplierOrder()
            newOrder.orderNum = order.orderNum
            newOrder.dateCreated = new Date()
            newOrder.supplier = order.supplier
            newOrder.parentOrder = order
            newOrder.state = SupplyOrderState.OPEN
            newOrder.total = 0
            if(!newOrder.save(flush: true)) {
                newOrder.errors.each {
                    println it
                }
            }

            order.addToReOrders(newOrder)
            order.save(flush: true)

            order.items.each { orderItem ->
                if(orderItem?.numberOfRejectItems > 0) {
                    SupplierOrderItem newOrderItem = new SupplierOrderItem()
                    newOrderItem.processed = false
                    newOrderItem.totalNumberOfItems = orderItem.numberOfRejectItems
                    newOrderItem.productOption = orderItem.productOption
                    newOrderItem.pricePerOption = orderItem.pricePerOption
                    newOrderItem.supplyOrder = newOrder

                    newOrder.addToItems(newOrderItem)
                    newOrder.save()
                }
            }
        }
    }
}
