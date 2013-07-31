package dev.thenaturalhorse.co.za

class ProductItem {

    BigDecimal price

    static belongsTo = [product: Product, order: Order]

    static constraints = {
        price(nullable: false)
        product(nullable: false)
        order(nullable: false)
    }
}
