package dev.thenaturalhorse.co.za

class SupplyOrderItem {

    Integer numItems
    BigDecimal pricePerOption

    static hasMany = [productOptions : ProductOption]

    static belongsTo = [supplyOrder : SupplyOrder]

    static constraints = {
        numItems(nullable: false)
        pricePerOption(nullable: false)
        productOptions(nullable: false)
    }
}
