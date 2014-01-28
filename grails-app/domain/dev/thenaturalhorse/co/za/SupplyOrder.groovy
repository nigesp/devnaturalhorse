package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class SupplyOrder {

    BigDecimal total
    SupplyOrderState state

    static hasMany = [items: SupplyOrderItem]

    static hasOne = [supplier: Supplier]

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
