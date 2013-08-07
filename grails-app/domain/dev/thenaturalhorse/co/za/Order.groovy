package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.OrderState

class Order {

    OrderState state

    static hasMany = [products: ProductItem]

    static belongsTo = [client: Client]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        state(nullable: false)
        products(nullable: true)
        client(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
