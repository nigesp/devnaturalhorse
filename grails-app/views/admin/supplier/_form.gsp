<%@ page import="dev.thenaturalhorse.co.za.Supplier" %>



<div class="control-group">
    <label class="control-label" for="name">Name
        %{--<span class="required-indicator">*</span>--}%
    </label>
    <div class="controls">
        <g:textField class="input-xlarge focused" id="name" name="name" required="" value="${supplierInstance?.name}"/>
    </div>
</div>

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

