package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.OrderState

class ClientOrder {

    OrderState state
    String deliveryInstructions

    static hasMany = [products: ProductItem, specialRequests: OrderSpecialRequest]

    static belongsTo = [client: Client]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        state(nullable: false)
        products(nullable: true)
        client(nullable: false)
        deliveryInstructions(nullable: true, blank: true)
        specialRequests(nullable: true)
    }

    static mapping = {
        autoTimestamp true
        deliveryInstructions(type: "text")
    }
}
