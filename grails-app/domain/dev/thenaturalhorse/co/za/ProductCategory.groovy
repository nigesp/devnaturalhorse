package dev.thenaturalhorse.co.za

class ProductCategory {

    String name

    static hasMany = [products: Product]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
        products(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }
}
