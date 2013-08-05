package dev.thenaturalhorse.co.za

class ProductCategory {

    String name

    static hasMany = [products: Product]

    static constraints = {
        name(nullable: false, blank: false)
        products(nullable: true)
    }
}
