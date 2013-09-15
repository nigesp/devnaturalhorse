package dev.thenaturalhorse.co.za

class PhysicalAddress {

    String buildingNameAndNumber
    String streetName
    String suburb
    String city
    String province
    String country
    Integer postCode

    static constraints = {
        buildingNameAndNumber(nullable: false, blank: false)
        streetName(nullable: false, blank: false)
        suburb(nullable: false, blank: false)
        city(nullable: false, blank: false)
        province(nullable: false, blank: false)
        country(nullable: false, blank: false)
        postCode(nullable: false)
    }
}
