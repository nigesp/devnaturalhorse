package dev.thenaturalhorse.co.za

class Order {

    static hasMany = [products: ProductItem]

    static belongsTo = [client: Client]

    static constraints = {
        products(nullable: true)
        client(nullable: false)
    }
}
