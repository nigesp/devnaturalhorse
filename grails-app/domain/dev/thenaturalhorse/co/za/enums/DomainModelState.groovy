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
    NOT_ACTIVE("Not Active"),
    DISABLED("Disabled")

    String name

    DomainModelState( String name ) {
        this.name = name
    }

    String getKey() {
        name()
    }
}
