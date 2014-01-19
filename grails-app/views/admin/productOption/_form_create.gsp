<%@ page import="dev.thenaturalhorse.co.za.ProductOption" %>

<div class="control-group <g:if test="${hasErrors(bean: productOptionInstance, field: 'price', 'error')}">error</g:if>">
	<label class="control-label" for="price">Price <span>*</span></label>
    <div class="controls">
        <g:textField name="price" value="${fieldValue(bean: productOptionInstance, field: 'price')}"/>
        <span class="help-inline"><g:fieldError field="price" bean="${productOptionInstance}" /></span>
    </div>
</div>

<g:render template="/admin/productOption/productOptionAttributeValuesSelect" collection="${productInstance?.productAttributes}" var="attribute" />