package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.ProductState

class Product {

    String name
    String description
    String manufacturer
    String imageUrl
    String ingredients
    int totalItems
    BigDecimal price
    ProductState state
    List productAttributes

    static hasMany = [productOptions: ProductOption, productAttributes: ProductAttribute]

    static belongsTo = [supplier: Supplier, category: ProductCategory]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(nullable: false, blank: false, unique: true)
        description(nullable: false, blank: false)
        manufacturer(nullable: false, blank: false)
        imageUrl(nullable: false, blank: false, validator: { val, obj ->
            if(val == "NF") {
                return ['required']
            } else if(val == "widthHeightError") {
                return ['width_height']
            } else if(val == "ratioError") {
                return ['ratio']
            } else {
                return true
            }
        })
        productOptions(nullable: true)
        ingredients(nullable: true)
        category(nullable: false)
        productAttributes(nullable: true)
        price(validator: { val, obj ->
            return (!productOptions() && !price()) ? ['required'] : true
        })
        state(nullable: false)
    }

    static mapping = {
        description(type: "text")
        ingredients(type: "text")
        autoTimestamp true
    }
}
