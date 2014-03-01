<%@ page import="dev.thenaturalhorse.co.za.ProductCategory" %>

<div class="control-group  <g:if test="${hasErrors(bean: productCategoryInstance, field: 'name', 'error')}">error</g:if>">
	<label class="control-label" for="name">Name <span>*</span></label>
    <div class="controls">
        <g:textField name="name" value="${productCategoryInstance?.name}"/>
        <span class="help-inline"><g:fieldError field="name" bean="${productCategoryInstance}" /></span>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productCategoryInstance, field: 'description', 'error')}">error</g:if>">
	<label class="control-label" for="description">Description <span>*</span></label>
    <div class="controls">
        <g:textArea id="textarea" class="input-xlarge" rows="3" cols="5" name="description" value="${productCategoryInstance?.description}" />
        <span class="help-inline"><g:fieldError field="description" bean="${productCategoryInstance}" /></span>
    </div>
</div>

