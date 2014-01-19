package dev.thenaturalhorse.co.za

class ProductOptionService {

    def populateOptionAttributes(ProductOption productOption) {
        productOption.productOptionAttributes.each {
            productOption.optionAttributes += (it?.attribute?.name).toLowerCase().trim()
            productOption.optionAttributes += (it?.value?.value).toLowerCase().trim()
        }

        return productOption
    }
}
