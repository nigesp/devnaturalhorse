package dev.thenaturalhorse.co.za

class Client {

    Basket basket

    static hasMany = [orders: Order]

    static constraints = {
        basket(nullable: true)
        orders(nullable: true)
    }
}
