package dev.thenaturalhorse.co.za

class ProductOption {

    BigDecimal price
    int numProducts

    static hasMany = [productOptionAttributes: ProductOptionAttribute]

    static belongsTo = [product: Product, order: ClientOrder, basket: Basket]

    static hasOne = [supplyOrder: SupplyOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        price(nullable: false)
        product(nullable: false)
        order(nullable: true)
        basket(nullable: true)
        productOptionAttributes(nullable: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
