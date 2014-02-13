package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class SupplierOrderTagLib {

    def supplyOrderButton = { attrs ->
        SupplierOrder order = attrs?.bean

        switch (order.state) {
            case SupplyOrderState.OPEN :
                out << g.render(template: '/admin/supplierOrder/button-add-product', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.ORDERED :
                out << g.render(template: '/admin/supplierOrder/button-received', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.RECEIVED :
                out << g.render(template: '/admin/supplierOrder/button-edit', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.PENDING_REORDER :
                out << g.render(template: '/admin/supplierOrder/button-edit', model: [supplierOrderInstance: order])
                break
            case SupplyOrderState.PROCESSED :
                out << g.render(template: '/admin/supplierOrder/button-paid', model: [supplierOrderInstance: order])
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

        BigDecimal total = orderItem.pricePerOption.multiply(orderItem?.numberOfItems)
        out << 'R ' + total
    }
}
