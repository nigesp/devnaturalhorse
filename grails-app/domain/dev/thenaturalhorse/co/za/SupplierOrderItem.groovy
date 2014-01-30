package dev.thenaturalhorse.co.za

class SupplierOrderItem {

    Integer numItems
    BigDecimal pricePerOption

    static hasOne = [productOption : ProductOption]

    static belongsTo = [supplyOrder : SupplierOrder]

    static constraints = {
        numItems(nullable: false)
        pricePerOption(nullable: false)
        productOption(nullable: false)
    }
}
