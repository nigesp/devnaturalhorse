package dev.thenaturalhorse.co.za

class PostalAddress {

    Integer poBoxNumber
    Integer postCode
    String suburb
    String city
    String province
    String country

    static constraints = {
        poBoxNumber(nullable: false)
        postCode(nullable: false)
        suburb(nullable: false, blank: false)
        city(nullable: false, blank: false)
        province(nullable: false, blank: false)
        country(nullable: false, blank: false)
    }
}
