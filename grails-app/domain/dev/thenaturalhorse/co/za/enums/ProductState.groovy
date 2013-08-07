package dev.thenaturalhorse.co.za.enums;

/**
 * Created with IntelliJ IDEA.
 * User: Nigel Espi
 * Date: 2012/06/19
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
public enum ProductState {
    ORDERED_FROM_SUPPLIER("Ordered from supplier"),
    INSPECTED("Inspected"),
    SEND_BACK_TO_SUPPLIER("Send back to supplier"),
    AVAILABLE("Available"),
    ADDED_TO_BASKET("Added to basket"),
    ADDED_TO_ORDER("Added to order"),
    SOLD("Sold"),
    RETURNED_DAMAGED("Returned damaged"),
    RETURNED_UNDELIVERED("Returned undelivered")

    String displayName

    ProductState( String displayName ) {
        this.displayName = displayName
    }
}
