package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class SupplierOrder {

    BigDecimal total
    SupplyOrderState state

    static hasMany = [items: SupplierOrderItem]

    static belongsTo = [supplier: Supplier]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        total(nullable: false)
        state(nullable: false)
        items(nullable: true)
        supplier(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
