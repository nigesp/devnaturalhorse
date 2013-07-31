package dev.thenaturalhorse.co.za

class Supplier {

    String name

    static hasMany = [product: Product]

    static constraints = {
        name(nullable: false, blank: false)
        product(nullable: true)
    }
}
