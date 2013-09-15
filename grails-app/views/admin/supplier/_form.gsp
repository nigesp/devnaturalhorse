<%@ page import="dev.thenaturalhorse.co.za.Supplier" %>

<div class="control-group">
    <label class="control-label" for="name">Name<span>*</span></label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="name" name="name" required="" value="${supplierInstance?.name}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Days for delivery
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:select name="daysFromOrderToDelivery" from="${1..100}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">State
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:select name="state" from="${dev.thenaturalhorse.co.za.enums.DomainModelState}"/>
    </div>
</div>

%{--<div class="page-header">
    <h3>Physical Address</h3>
</div>

<div class="control-group">
    <label class="control-label" for="name">Building Name & Number
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="buildingNameAndNumber" name="buildingNameAndNumber" required="true"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Street Name
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="streetName" name="streetName" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Suburb
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="suburb" name="suburb" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">City
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="city" name="city" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Province
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="province" name="province" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Country
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="country" name="country" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Post Code
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="postCode" name="postCode" required=""/>
    </div>
</div>

<div class="page-header">
    <h3>Postal Address</h3>
</div>

<div class="control-group">
    <label class="control-label" for="name">P.O.Box Number
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="poBoxNumber" name="poBoxNumber" required="true"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Suburb
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="suburb" name="suburb" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">City
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="city" name="city" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Province
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="province" name="province" required=""/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="name">Country
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="country" name="country" required=""/>
    </div>
</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'product', 'error')} ">
    <label for="product">
        <g:message code="supplier.product.label" default="Product"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${supplierInstance?.product ?}" var="p">
            <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="product" action="create"
                    params="['supplier.id': supplierInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Product')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'supplyOrders', 'error')} ">
    <label for="supplyOrders">
        <g:message code="supplier.supplyOrders.label" default="Supply Orders"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${supplierInstance?.supplyOrders ?}" var="s">
            <li><g:link controller="supplyOrder" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="supplyOrder" action="create"
                    params="['supplier.id': supplierInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'supplyOrder.label', default: 'SupplyOrder')])}</g:link>
        </li>
    </ul>

</div>--}%

