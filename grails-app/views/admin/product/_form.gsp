<%@ page import="dev.thenaturalhorse.co.za.Product" %>

<div class="control-group  <g:if test="${hasErrors(bean: productInstance, field: 'name', 'error')}">error</g:if>">
	<label class="control-label" for="name">Name <span>*</span></label>
    <div class="controls">
        <g:textField name="name" value="${productInstance?.name}"/>
        <span class="help-inline"><g:fieldError field="name" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: productInstance, field: 'description', 'error')}">error</g:if>">
	<label class="control-label" for="description">Description <span>*</span></label>
    <div class="controls">
        <g:textArea id="textarea" class="input-xlarge" rows="3" cols="5" name="description" value="${productInstance?.description}" />
        <span class="help-inline"><g:fieldError field="description" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'manufacturer', 'error')}">error</g:if>">
	<label class="control-label" for="manufacturer">Manufacturer <span>*</span></label>
    <div class="controls">
        <g:textField name="manufacturer" value="${productInstance?.manufacturer}"/>
        <span class="help-inline"><g:fieldError field="manufacturer" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'imageUrl', 'error')}">error</g:if>">
	<label class="control-label" for="imageUrl">Product Image <span>*</span></label>
    <div class="controls">
        <input class="" type="file" name="productImage" />
        <span class="help-inline"><g:fieldError field="imageUrl" bean="${productInstance}" /></span>
        <p class="help-block input-help-text">Image must be a JPEG file 700px x 650px.</p>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'ingredients', 'error')}">error</g:if>">
	<label class="control-label" for="ingredients">Ingredients</label>
    <div class="controls">
        <g:textArea id="textarea" class="input-xlarge" rows="3" cols="5" name="ingredients" value="${productInstance?.ingredients}" />
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'category', 'error')}">error</g:if>">
	<label class="control-label" for="category">Category <span>*</span></label>
    <div class="controls">
        <g:select id="category" name="category.id" from="${dev.thenaturalhorse.co.za.ProductCategory.list()}" optionKey="id" optionValue="name" value="${productInstance?.category?.id}" class="many-to-one"/>
        <span class="help-inline"><g:fieldError field="category" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'supplier', 'error')}">error</g:if>">
	<label class="control-label" for="supplier">Supplier <span>*</span></label>
    <div class="controls">
        <g:select id="supplier" name="supplier.id" from="${dev.thenaturalhorse.co.za.Supplier.list()}" optionKey="id" optionValue="name" value="${productInstance?.supplier?.id}" class="many-to-one"/>
        <span class="help-inline"><g:fieldError field="supplier" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'price', 'error')}">error</g:if>">
    <label class="control-label" for="price">Price <span>*</span></label>
    <div class="controls">
        <g:textField name="price" value="${productInstance?.price}"/>
        <span class="help-inline"><g:fieldError field="price" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group <g:if test="${hasErrors(bean: productInstance, field: 'totalItems', 'error')}">error</g:if>">
    <label class="control-label" for="totalItems">Number of Items <span>*</span></label>
    <div class="controls">
        <g:textField name="totalItems" value="${productInstance?.totalItems}"/>
        <span class="help-inline"><g:fieldError field="totalItems" bean="${productInstance}" /></span>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="state">State<span class="required-indicator">*</span></label>
    <div class="controls">
        <g:select name="state" from="${dev.thenaturalhorse.co.za.enums.ProductState}" value="${productInstance?.state}"/>
    </div>
</div>

