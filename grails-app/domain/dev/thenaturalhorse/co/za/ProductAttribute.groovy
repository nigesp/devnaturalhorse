package dev.thenaturalhorse.co.za

class ProductAttribute {

    String name
    List values

    static hasMany = [values: ProductAttributeValue]

    static belongsTo = [product: Product]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        product(nullable: false)
        name(nullable: false, blank: false, validator: { val, obj ->
            obj?.product?.productAttributes?.each { attribute ->
                if(attribute?.name == val) {
                    return ['unique']
                }
            }
            return true
        })
        values(nullable: false, minSize: 1)
    }

    static mapping = {
        autoTimestamp true
    }

}
