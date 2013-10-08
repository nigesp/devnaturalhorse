package dev.thenaturalhorse.co.za

class ProductAttribute {

    String name

    static hasMany = [productAttributeValues: ProductAttributeValue]

    static belongsTo = [product: Product]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false)
        productAttributeValues(nullable: true)
        product(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }

}
