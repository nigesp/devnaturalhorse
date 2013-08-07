package dev.thenaturalhorse.co.za

class Practitioner {

    String firstName
    String lastName
    BigDecimal price
    String description
    String profilePicUrl

    static hasMany = [articles: Article, practitionerTypes: PractitionerType]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        articles(nullable: true)
        practitionerTypes(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
