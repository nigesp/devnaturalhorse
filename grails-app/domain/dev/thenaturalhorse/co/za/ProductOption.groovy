package dev.thenaturalhorse.co.za

class ProductOption {

    BigDecimal price
    int numProducts
    List<ProductOptionAttribute> productOptionAttributes
    String optionAttributes

    static belongsTo = [product: Product, order: ClientOrder, basket: Basket]

    static hasOne = [supplierOrderItem: SupplierOrderItem]

    static hasMany = [productOptionAttributes: ProductOptionAttribute, supplyOrderItems: SupplierOrderItem]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        price(nullable: false)
        product(nullable: false)
        order(nullable: true)
        basket(nullable: true)
        supplierOrderItem(nullable: true)
        productOptionAttributes(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }

    static transients = ['optionAttributes']

    static namedQueries = {
        findAllForSupplier { supplier ->
            createAlias('product', 'p')
            eq('p.supplier', supplier)
        }
    }
}
