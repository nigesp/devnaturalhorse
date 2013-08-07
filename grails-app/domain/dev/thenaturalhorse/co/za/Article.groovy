package dev.thenaturalhorse.co.za

class Article {

    String article
    List<String> imageUrls

    static belongsTo = [practitioner: Practitioner]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        article(nullable: false, blank: false)
        practitioner(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
