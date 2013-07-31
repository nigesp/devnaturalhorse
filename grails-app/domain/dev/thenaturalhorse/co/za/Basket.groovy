package dev.thenaturalhorse.co.za

class Basket {

    static hasMany = [products: ProductItem]

    static hasOne = [client: Client]

    static constraints = {
        products(nullable: false)
    }
}
