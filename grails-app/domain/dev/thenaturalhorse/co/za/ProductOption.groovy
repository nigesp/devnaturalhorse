package dev.thenaturalhorse.co.za

class ProductOption {

    BigDecimal price
    int numProducts
    String attribute
    String value

    static belongsTo = [product: Product, order: ClientOrder, basket: Basket]

    static hasOne = [supplyOrder: SupplyOrder]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        price(nullable: false)
        product(nullable: false)
        order(nullable: true)
        basket(nullable: true)
        attribute(nullable: false, blank: false)
        value(nullable: false, blank: false)
    }

    static mapping = {
        autoTimestamp true
    }
}
