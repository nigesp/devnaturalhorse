package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.ProductState

class ProductItem {

    BigDecimal price
    Date useBy
    String size
    Float weight
    String colour
    String containerType
    float productLength
    float thickness
    String material
    ProductState state

    static belongsTo = [product: Product, order: ClientOrder, basket: Basket]

    static hasOne = [supplyOrder: SupplyOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        price(nullable: false)
        product(nullable: false)
        order(nullable: true)
        basket(nullable: true)
        useBy(nullable: true)
        size(nullable: true, blank: true)
        weight(nullable: true)
        colour(nullable: true, blank: true)
        containerType(nullable: true, blank: true)
        material(nullable: true)
        state(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
