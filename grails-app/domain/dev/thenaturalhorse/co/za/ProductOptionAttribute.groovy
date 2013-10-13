package dev.thenaturalhorse.co.za

class ProductOptionAttribute {

    ProductAttribute attribute
    ProductAttributeValue value

    Date dateCreated
    Date lastUpdated

    //static belongsTo = [productOption: ProductOption]

    static constraints = {
        attribute(nullable: false)
        value(nullable: false)
    }

    static mapping = {
      autoTimestamp true
    }
}
