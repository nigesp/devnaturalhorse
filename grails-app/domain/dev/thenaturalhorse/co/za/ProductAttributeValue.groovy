package dev.thenaturalhorse.co.za

class ProductAttributeValue {

    String value

    static belongsTo = [productAttribute: ProductAttribute]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        value(nullable: false, blank: false)
        productAttribute(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
