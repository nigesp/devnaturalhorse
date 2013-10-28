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

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'order', 'error')} ">
	<label for="order">
		<g:message code="productOption.order.label" default="Order" />
		
	</label>
	<g:select id="order" name="order.id" from="${dev.thenaturalhorse.co.za.ClientOrder.list()}" optionKey="id" value="${productOptionInstance?.order?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'basket', 'error')} ">
	<label for="basket">
		<g:message code="productOption.basket.label" default="Basket" />
		
	</label>
	<g:select id="basket" name="basket.id" from="${dev.thenaturalhorse.co.za.Basket.list()}" optionKey="id" value="${productOptionInstance?.basket?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'attribute', 'error')} required">
	<label for="attribute">
		<g:message code="productOption.attribute.label" default="Attribute" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="attribute" required="" value="${productOptionInstance?.attribute}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="productOption.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="value" required="" value="${productOptionInstance?.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'numProducts', 'error')} required">
	<label for="numProducts">
		<g:message code="productOption.numProducts.label" default="Num Products" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="numProducts" required="" value="${fieldValue(bean: productOptionInstance, field: 'numProducts')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'supplyOrder', 'error')} required">
	<label for="supplyOrder">
		<g:message code="productOption.supplyOrder.label" default="Supply Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="supplyOrder" name="supplyOrder.id" from="${dev.thenaturalhorse.co.za.SupplyOrder.list()}" optionKey="id" required="" value="${productOptionInstance?.supplyOrder?.id}" class="many-to-one"/>
</div>

