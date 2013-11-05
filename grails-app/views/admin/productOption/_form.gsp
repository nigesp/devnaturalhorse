<%@ page import="dev.thenaturalhorse.co.za.ProductOption" %>



<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="productOption.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" required="" value="${fieldValue(bean: productOptionInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productOption.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${dev.thenaturalhorse.co.za.Product.list()}" optionKey="id" required="" value="${productOptionInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'attribute', 'error')} required">
	<label for="attribute">
		<g:message code="productOption.attribute.label" default="Attribute" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:textField name="attribute" required="" value="${productOptionInstance?.attribute}"/>--}%
    <g:select name="attribute" from="${productInstance?.productAttributes}" optionKey="id" optionValue="name" noSelection="['-1':'--Select Attribute--']"/>
</div>

%{--<g:render template="/admin/productOption/productOptionAttributeValuesSelect" bean="${productInstance?.productAttributes}" var="attributeValues" />--}%

