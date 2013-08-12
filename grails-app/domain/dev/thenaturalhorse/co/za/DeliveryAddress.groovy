package dev.thenaturalhorse.co.za

class DeliveryAddress {

    String addressLine1
    String addressLine2
    String city
    String province
    int postCode

    static belongsTo = [client: Client]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        addressLine1(nullable: false, blank: false)
        addressLine2(nullable: false, blank: false)
        city(nullable: false, blank: false)
        province(nullable: false, blank: false)
        client(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
