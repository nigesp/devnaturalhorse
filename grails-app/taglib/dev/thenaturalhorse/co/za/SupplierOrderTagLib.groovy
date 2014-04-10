package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class SupplierOrderTagLib {

    def supplyOrderButton = { attrs ->
        SupplierOrder order = attrs?.bean

        switch (order.state) {
            case SupplyOrderState.OPEN :
                out << g.render(template: '/admin/supplierOrder/buttons/button-add-product', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.ORDERED :
                out << g.render(template: '/admin/supplierOrder/buttons/button-received', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.RECEIVED :
                out << g.render(template: '/admin/supplierOrder/buttons/button-edit', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.PENDING_REORDER :
                out << g.render(template: '/admin/supplierOrder/buttons/button-edit', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.PROCESSED :
                out << g.render(template: '/admin/supplierOrder/buttons/button-paid', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.PAID :
                out << '-'
                break
        }
    }

    def supplyOrderState = { attr ->
        SupplierOrder order = attr?.bean

        switch (order.state) {
            case SupplyOrderState.OPEN :
                out << '<span class=\"label label-info\">OPEN</span>'
                break
            case SupplyOrderState.ORDERED :
                out << '<span class=\"label label-success\">ORDERED</span>'
                break
            case SupplyOrderState.RECEIVED :
                out << '<span class=\"label\">RECIEVED</span>'
                break
            case SupplyOrderState.PENDING_REORDER :
                out << '<span class=\"label label-important\">PENDING RE-ORDER</span>'
                break
            case SupplyOrderState.PROCESSED :
                out << '<span class=\"label label-warning\">PRCESSED</span>'
                break
            case SupplyOrderState.PAID :
                out << '<span class=\"label label-inverse\">PAID</span>'
                break
        }
    }

    def supplierOrderItemTotalPrice = { attr ->
        SupplierOrderItem orderItem = attr?.bean

        BigDecimal total = orderItem.pricePerOption.multiply(orderItem?.totalNumberOfItems)
        out << 'R ' + total
    }

    def supplierOrderTotalPrice = { attr ->
        SupplierOrder order = attr?.bean
        BigDecimal orderTotal = new BigDecimal(0)

        order.items.each {
            BigDecimal orderItemTotal = it.pricePerOption.multiply(new BigDecimal(it.numberOfApprovedItems))
            orderTotal = orderTotal.add(orderItemTotal)
        }

        out << '<div>R ' + orderTotal + '</div>'
    }

    def supplierOrderActionButton = { attr ->
        SupplierOrder order = attr?.bean

        switch (order.state) {
            case SupplyOrderState.OPEN :
                if (order.items.size() > 0) {
                    out << g.render(template: '/admin/supplierOrder/buttons/button-submit-to-supplier', model: [supplierOrderInstance: order])
                }
                break
            case SupplyOrderState.ORDERED :
                out << g.render(template: '/admin/supplierOrder/buttons/button-received', model: [supplierOrderInstance: order, now: new Date()])
                break
            case SupplyOrderState.RECEIVED :
                out << g.render(template: '/admin/supplierOrder/buttons/button-process', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.PENDING_REORDER :
                out << '<span class=\"label label-important\">PENDING RE-ORDER</span>'
                break
            case SupplyOrderState.PROCESSED :
                out << '<span class=\"label label-warning\">PRCESSED</span>'
                break
            case SupplyOrderState.PAID :
                out << '<span class=\"label label-inverse\">PAID</span>'
                break
        }
    }

    def supplyOrderItemActionButton = { attr ->
        SupplierOrderItem orderItem = attr?.bean

        switch (orderItem.supplyOrder.state) {
            case SupplyOrderState.OPEN :
                out << g.render(template: '/admin/supplierOrder/templates/item-actions-open', model: [orderItemInstance: orderItem])
                break
            case SupplyOrderState.ORDERED :
                out << ''
                break
            case SupplyOrderState.RECEIVED :
                if(!orderItem.processed) {
                    out << g.render(template: '/admin/supplierOrder/templates/item-actions-received', model: [orderItemInstance: orderItem])
                } else {
                    out << '<td><span class="icon-ok"></span></td>'
                }
                break
            case SupplyOrderState.PENDING_REORDER :
                out << ''
                break
            case SupplyOrderState.PROCESSED :
                out << ''
                break
            case SupplyOrderState.PAID :
                out << ''
                break
        }
    }
}
