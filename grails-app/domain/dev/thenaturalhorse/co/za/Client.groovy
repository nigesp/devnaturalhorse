package dev.thenaturalhorse.co.za

class Client {

    static hasMany = [orders: Order]

    static constraints = {
        orders(nullable: true)
    }
}
