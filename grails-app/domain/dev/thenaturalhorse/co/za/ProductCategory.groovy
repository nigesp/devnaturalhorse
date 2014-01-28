package dev.thenaturalhorse.co.za

class ProductCategory {

    String name
    String description

    static hasMany = [products: Product]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false, unique: true)
        description(nullable: false, blank: false)
        products(nullable: true)
    }

    static mapping = {
        autoTimestamp true
        description(type: "text")
    }
}
