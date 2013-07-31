package dev.thenaturalhorse.co.za

class Order {

    static hasMany = [products: Product]

    static belongsTo = [client: Client]

    static constraints = {
        products(nullable: true)
        client(nullable: false)
    }
}
