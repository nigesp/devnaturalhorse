package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.DomainModelState

class Supplier {

    String name
    String supplierCode
    Integer daysFromOrderToDelivery
    PostalAddress postalAddress
    PhysicalAddress physicalAddress
    DomainModelState status

    static hasMany = [products: Product, supplierOrders: SupplierOrder, contacts: Contact]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
        supplierCode(nullable: false, blank: false, unique: true)
        products(nullable: true)
        supplierOrders(nullable: true)
        daysFromOrderToDelivery(nullable: false)
        postalAddress(nullable: true)
        physicalAddress(nullable: true)
        contacts(nullable: true)
        status(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }

    static namedQueries = {
        findAllActive {
            eq('status', DomainModelState.ACTIVE)
        }
    }
}
