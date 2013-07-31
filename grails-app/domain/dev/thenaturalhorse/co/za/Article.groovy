package dev.thenaturalhorse.co.za

class Article {

    static belongsTo = [practitioner: Practitioner]

    static constraints = {
        practitioner(nullable: false)
    }
}
