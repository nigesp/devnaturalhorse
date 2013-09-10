package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.OrderSpecialRequestState

class OrderSpecialRequest {

    String request
    OrderSpecialRequestState state

    static belongsTo = [order: ClientOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        request(nullable: false, blank: false)
        state(nullable: false)
        order(nullable: false)
    }

    static mapping = {
        autoTimestamp true
        request(type: "text")
    }
}
