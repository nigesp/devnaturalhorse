package dev.thenaturalhorse.co.za

class ProductOption {

    BigDecimal price
    int numProducts
    List<ProductOptionAttribute> productOptionAttributes

    static belongsTo = [product: Product, order: ClientOrder, basket: Basket]

    static hasOne = [supplyOrder: SupplyOrder]

    static hasMany = [productOptionAttributes: ProductOptionAttribute]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        price(nullable: false)
        product(nullable: false)
        order(nullable: true)
        basket(nullable: true)
        supplyOrder(nullable: true)
        productOptionAttributes(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }
}
