package dev.thenaturalhorse.co.za

class Supplier {

    String name

    static hasMany = [product: Product, supplyOrders: SupplyOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
        product(nullable: true)
        supplyOrders(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }
}
