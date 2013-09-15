package dev.thenaturalhorse.co.za.enums;

/**
 * Created with IntelliJ IDEA.
 * User: Nigel Espi
 * Date: 2012/06/19
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
public enum DomainModelState {
    ACTIVE("Active"),
    DISABLED("Disabled")

    String displayName

    DomainModelState( String displayName ) {
        this.displayName = displayName
    }
}
