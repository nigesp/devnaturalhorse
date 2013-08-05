package dev.thenaturalhorse.co.za

class Product {

    String name
    String description
    String manufacturer
    String imageUrl
    String ingredients

    static hasMany = [productItems: ProductItem]

    static belongsTo = [supplier: Supplier, category: Category]

    static constraints = {
        name(nullable: false, blank: false)
        description(nullable: false, blank: false)
        manufacturer(nullable: false, blank: false)
        imageUrl(nullable: false, blank: false)
        productItems(nullable: true)
        ingredients(nullable: true)
        category(nullable: false)
    }

    static mapping = {
        description(type: "text")
    }
}
