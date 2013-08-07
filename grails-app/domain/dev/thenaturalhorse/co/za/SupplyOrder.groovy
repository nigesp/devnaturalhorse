package dev.thenaturalhorse.co.za

class SupplyOrder {

    static hasMany = [items: ProductItem]

    static hasOne = [supplier: Supplier]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        items(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
