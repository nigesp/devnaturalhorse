package dev.thenaturalhorse.co.za.enums;

/**
 * Created with IntelliJ IDEA.
 * User: Nigel Espi
 * Date: 2012/06/19
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
public enum OrderSpecialRequestState {
    NEW("New"),
    IN_PROGRESS("In progress"),
    ACTIONED("Actioned")

    String displayName

    OrderSpecialRequestState( String displayName ) {
        this.displayName = displayName
    }
}
