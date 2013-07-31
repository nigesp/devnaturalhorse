package dev.thenaturalhorse.co.za

class PractitionerType {

    String name

    static constraints = {
        name(nullable: false, blank: false)
    }
}
