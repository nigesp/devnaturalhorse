package dev.thenaturalhorse.co.za

class Product {

    String name
    String description
    String manufacturer
    String imageUrl
    String ingredients

    static hasMany = [productItems: ProductItem]

    static belongsTo = [supplier: Supplier, category: ProductCategory]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
        description(nullable: false, blank: false)
        manufacturer(nullable: false, blank: false)
        imageUrl(nullable: false, blank: false, url: true)
        productItems(nullable: true)
        ingredients(nullable: true)
        category(nullable: false)
    }

    static mapping = {
        description(type: "text")
        ingredients(type: "text")
        autoTimestamp true
    }
}
