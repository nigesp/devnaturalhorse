package dev.thenaturalhorse.co.za

class Basket {

    static hasMany = [products: ProductItem]

    static hasOne = [client: Client]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        products(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
