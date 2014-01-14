<%@ page import="dev.thenaturalhorse.co.za.ProductAttributeValue" %>

<div class="control-group  <g:if test="${hasErrors(bean: productAttributeValueInstance, field: 'value', 'error')}">error</g:if>">
    <label class="control-label" for="value">New value <span>*</span></label>
    <div class="controls">
        <g:textField name="value" value="${productAttributeValueInstance?.value}"/>
        <span class="help-inline"><g:fieldError field="value" bean="${productAttributeValueInstance}" /></span>
    </div>
</div>

