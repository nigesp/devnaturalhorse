package dev.thenaturalhorse.co.za

class SupplierOrderItemDefect {

    int numItems
    String description

    static belongsTo = [supplierOrderItem: SupplierOrderItem]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        numItems(min: 1)
        description(nullable: false, blank: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
