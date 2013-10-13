package dev.thenaturalhorse.co.za

class ProductAttribute {

    String name
    List values

    static hasMany = [values: String]

    static belongsTo = [product: Product]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false, unique: true)
        values(nullable: false, minSize: 1)
        product(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }

}
