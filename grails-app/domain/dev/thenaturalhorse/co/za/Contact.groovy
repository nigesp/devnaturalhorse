package dev.thenaturalhorse.co.za

class Contact {

    String firstName
    String lastName
    String cellNumber
    String landLineNumber

    static constraints = {
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        cellNumber(nullable: false, blank: false)
        landLineNumber(nullable: false, blank: false)
    }
}
