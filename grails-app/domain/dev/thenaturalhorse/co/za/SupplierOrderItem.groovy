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
        productOption(nullable: false, validator: { val, obj ->
            if(!obj?.id && obj.supplyOrder == SupplierOrder.containsProductOption(val).get()) {
                return ['duplicate']
            } else {
                return true
            }
        })
        supplyOrder(nullable: false)
    }
}
