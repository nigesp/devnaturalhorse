package dev.thenaturalhorse.co.za

class Client {

    String firstName
    String lastName
    String emailAddress
    Basket basket
    DeliveryAddress address

    static hasMany = [orders: ClientOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        emailAddress(nullable: false, email: true)
        basket(nullable: true)
        orders(nullable: true)
        address(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
