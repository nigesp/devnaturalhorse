package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.OrderSpecialRequestState

class OrderSpecialRequest {

    String request
    OrderSpecialRequestState state

    static belongsTo = [order: Order]

    static constraints = {
        request(nullable: false, blank: false)
        state(nullable: false)
        order(nullable: false)
    }

    static mapping = {
        request(type: "text")
    }
}
