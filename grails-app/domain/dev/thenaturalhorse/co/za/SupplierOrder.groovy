package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class SupplierOrder {

    String orderNum
    BigDecimal total
    SupplyOrderState state

    static hasMany = [items: SupplierOrderItem, reOrders: SupplierOrder]

    static belongsTo = [supplier: Supplier, parentOrder: SupplierOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        orderNum(nullable: false)
        total(nullable: false)
        state(nullable: false)
        items(nullable: true)
        supplier(nullable: false)
        reOrders(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }

    static namedQueries = {
        containsProductOption { productOption ->
            createAlias("items", "item")
            eq("item.productOption", productOption)
        }
    }
}
