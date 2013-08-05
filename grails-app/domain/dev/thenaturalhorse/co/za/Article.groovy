package dev.thenaturalhorse.co.za

class Article {

    String article
    List<String> imageUrls

    static belongsTo = [practitioner: Practitioner]

    static constraints = {
        article(nullable: false, blank: false)
        practitioner(nullable: false)
    }
}
