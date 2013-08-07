package dev.thenaturalhorse.co.za

class PractitionerType {

    String name

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
