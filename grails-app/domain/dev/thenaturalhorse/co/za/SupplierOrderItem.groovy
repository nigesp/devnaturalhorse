package dev.thenaturalhorse.co.za

class SupplierOrderItem {

    int totalNumberOfItems
    int numberOfApprovedItems
    int numberOfRejectItems
    BigDecimal pricePerOption
    String rejectionReason
    boolean processed = false

    static hasOne = [productOption : ProductOption]

    static belongsTo = [supplyOrder : SupplierOrder]

    static constraints = {
        totalNumberOfItems(nulllable: false, min: 1)
        numberOfRejectItems(nullable: true)
        numberOfApprovedItems(nullable: true)
        pricePerOption(nullable: false)
        productOption(nullable: false, validator: { val, obj ->
            if(!obj?.id && obj.supplyOrder == SupplierOrder.containsProductOption(val).get()) {
                return ['duplicate']
            } else {
                return true
            }
        })
        supplyOrder(nullable: false)
        rejectionReason(nullable: true, blank: true)
    }

    static mapping = {
        rejectionReason(type: "text")
    }
}
