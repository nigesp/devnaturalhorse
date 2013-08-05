package dev.thenaturalhorse.co.za

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

    static belongsTo = [product: Product, order: Order, basket: Basket]

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
    }

    static mapping = {
        autoTimestamp true
    }
}
