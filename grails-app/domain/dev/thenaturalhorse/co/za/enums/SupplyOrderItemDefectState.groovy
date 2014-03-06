package dev.thenaturalhorse.co.za.enums;

/**
 * Created with IntelliJ IDEA.
 * User: Nigel Espi
 * Date: 2012/06/19
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
public enum SupplyOrderItemDefectState {
    OPEN("Open"),
    ORDERED("Ordered"),
    RECEIVED("Received"),
    PENDING_REORDER("Pending Reorder"),
    PROCESSED("Processed"),
    PAID("Paid")

    String displayName

    SupplyOrderItemDefectState( String displayName ) {
        this.displayName = displayName
    }
}
