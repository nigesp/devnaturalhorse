package dev.thenaturalhorse.co.za

class SupplierOrderItem {

    int numberOfItems
    BigDecimal pricePerOption

    static hasOne = [productOption : ProductOption]

    static belongsTo = [supplyOrder : SupplierOrder]

    static constraints = {
        numberOfItems(nullable: false, validator: { val, obj ->
            if(val < 1) {
                return ['minValue']
            } else {
                return true
            }
        })
        pricePerOption(nullable: false)
        productOption(nullable: false)
        supplyOrder(nullable: false)
    }
}
