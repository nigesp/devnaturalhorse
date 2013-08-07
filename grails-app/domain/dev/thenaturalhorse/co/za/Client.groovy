package dev.thenaturalhorse.co.za

class Client {

    Basket basket

    static hasMany = [orders: Order]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        basket(nullable: true)
        orders(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }
}
