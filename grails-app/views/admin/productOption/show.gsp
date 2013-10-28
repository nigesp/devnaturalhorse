
<%@ page import="dev.thenaturalhorse.co.za.ProductOption" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productOption.label', default: 'ProductOption')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productOption" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productOption" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productOption">
			
				<g:if test="${productOptionInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="productOption.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productOptionInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productOption.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productOptionInstance?.product?.id}">${productOptionInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.order}">
				<li class="fieldcontain">
					<span id="order-label" class="property-label"><g:message code="productOption.order.label" default="Order" /></span>
					
						<span class="property-value" aria-labelledby="order-label"><g:link controller="clientOrder" action="show" id="${productOptionInstance?.order?.id}">${productOptionInstance?.order?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.basket}">
				<li class="fieldcontain">
					<span id="basket-label" class="property-label"><g:message code="productOption.basket.label" default="Basket" /></span>
					
						<span class="property-value" aria-labelledby="basket-label"><g:link controller="basket" action="show" id="${productOptionInstance?.basket?.id}">${productOptionInstance?.basket?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.attribute}">
				<li class="fieldcontain">
					<span id="attribute-label" class="property-label"><g:message code="productOption.attribute.label" default="Attribute" /></span>
					
						<span class="property-value" aria-labelledby="attribute-label"><g:fieldValue bean="${productOptionInstance}" field="attribute"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="productOption.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${productOptionInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="productOption.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productOptionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="productOption.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productOptionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.numProducts}">
				<li class="fieldcontain">
					<span id="numProducts-label" class="property-label"><g:message code="productOption.numProducts.label" default="Num Products" /></span>
					
						<span class="property-value" aria-labelledby="numProducts-label"><g:fieldValue bean="${productOptionInstance}" field="numProducts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productOptionInstance?.supplyOrder}">
				<li class="fieldcontain">
					<span id="supplyOrder-label" class="property-label"><g:message code="productOption.supplyOrder.label" default="Supply Order" /></span>
					
						<span class="property-value" aria-labelledby="supplyOrder-label"><g:link controller="supplyOrder" action="show" id="${productOptionInstance?.supplyOrder?.id}">${productOptionInstance?.supplyOrder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productOptionInstance?.id}" />
					<g:link class="edit" action="edit" id="${productOptionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
