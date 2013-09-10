package dev.thenaturalhorse.co.za.enums;

/**
 * Created with IntelliJ IDEA.
 * User: Nigel Espi
 * Date: 2012/06/19
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
public enum OrderState {
    ORDER_PLACED("ClientOrder placed"),
    PRINTED("Printed"),
    AWAITING_COURIER("Awaiting courier"),
    WITH_COURIER("With courier")

    String displayName

    OrderState( String displayName ) {
        this.displayName = displayName
    }
}
