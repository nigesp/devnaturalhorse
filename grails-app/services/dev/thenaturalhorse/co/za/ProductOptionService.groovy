package dev.thenaturalhorse.co.za

class ProductOptionService {

    def populateOptionAttributes(ProductOption productOption) {
        productOption.productOptionAttributes.each {
            productOption.optionAttributes += (it?.attribute?.name).toLowerCase().trim()
            productOption.optionAttributes += (it?.value?.value).toLowerCase().trim()
        }

        return productOption
    }

    def adProcessedItemsToStock(SupplierOrder order) {
        order?.items?.each { orderItem ->
            //TODO: throw an exception if orderItem is not processed.
            ProductOption productOption = orderItem?.productOption
            productOption?.numProducts += orderItem?.numberOfApprovedItems
            productOption.save()
        }
    }
}
