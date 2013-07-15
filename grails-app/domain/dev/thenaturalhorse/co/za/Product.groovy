package dev.thenaturalhorse.co.za

class Product {

    String name;
    BigDecimal price;

    static constraints = {
        name(nullable: false, blank: false)
        price(nullable: false)
    }
}
