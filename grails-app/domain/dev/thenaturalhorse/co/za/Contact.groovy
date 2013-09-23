package dev.thenaturalhorse.co.za

class Contact {

    String position
    String firstName
    String lastName
    String cellNumber
    String landLineNumber
    String emailAddress

    static constraints = {
        position(nullable: false, blank: false)
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        cellNumber(nullable: false, blank: false)
        landLineNumber(nullable: false, blank: false)
        emailAddress(email: true)
    }
}
