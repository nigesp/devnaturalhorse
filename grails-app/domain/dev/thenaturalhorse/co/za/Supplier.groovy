package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.DomainModelState

class Supplier {

    String name
    Integer daysFromOrderToDelivery
    PostalAddress postalAddress
    PhysicalAddress physicalAddress
    DomainModelState state

    static hasMany = [products: Product, supplyOrders: SupplyOrder, contacts: Contact]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
        products(nullable: true)
        supplyOrders(nullable: true)
        daysFromOrderToDelivery(nullable: false)
        postalAddress(nullable: true)
        physicalAddress(nullable: true)
        contacts(nullable: true)
        state(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }

    static namedQueries = {
        findAllActive {
            eq('state', DomainModelState.ACTIVE)
        }
    }
}
