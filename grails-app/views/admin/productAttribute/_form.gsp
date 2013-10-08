<div class="control-group  <g:if test="${hasErrors(bean: attributeCommand, field: 'name', 'error')}">error</g:if>">
    <label class="control-label" for="name">Name <span>*</span></label>
    <div class="controls">
        <g:textField name="name" value="${attributeCommand?.name}"/>
        <span class="help-inline"><g:fieldError field="name" bean="${attributeCommand}" /></span>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: attributeCommand, field: 'name', 'error')}">error</g:if>">
    <label class="control-label" for="defaultValue">Default Value <span>*</span></label>
    <div class="controls">
        <g:textField name="defaultValue" value="${attributeCommand?.name}"/>
        <span class="help-inline"><g:fieldError field="defaultValue" bean="${attributeCommand}" /></span>
    </div>
</div>


%{--<div class="fieldcontain ${hasErrors(bean: productAttributeInstance, field: 'productAttributeValues', 'error')} ">
	<label for="productAttributeValues">
		<g:message code="productAttribute.productAttributeValues.label" default="Product Attribute Values" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productAttributeInstance?.productAttributeValues?}" var="p">
    <li><g:link controller="productAttributeValue" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productAttributeValue" action="create" params="['productAttribute.id': productAttributeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productAttributeValue.label', default: 'ProductAttributeValue')])}</g:link>
</li>
</ul>

</div>--}%

<g:hiddenField name="product.id" value="${productInstance?.id}"/>

%{--<div class="fieldcontain ${hasErrors(bean: productAttributeInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productAttribute.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${dev.thenaturalhorse.co.za.Product.list()}" optionKey="id" required="" value="${productAttributeInstance?.product?.id}" class="many-to-one"/>
</div>--}%

