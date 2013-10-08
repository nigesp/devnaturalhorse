
<%@ page import="dev.thenaturalhorse.co.za.ProductAttribute" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productAttribute.label', default: 'ProductAttribute')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productAttribute" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productAttribute" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productAttribute">
			
				<g:if test="${productAttributeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="productAttribute.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productAttributeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productAttributeInstance?.productAttributeValues}">
				<li class="fieldcontain">
					<span id="productAttributeValues-label" class="property-label"><g:message code="productAttribute.productAttributeValues.label" default="Product Attribute Values" /></span>
					
						<g:each in="${productAttributeInstance.productAttributeValues}" var="p">
						<span class="property-value" aria-labelledby="productAttributeValues-label"><g:link controller="productAttributeValue" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productAttributeInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productAttribute.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productAttributeInstance?.product?.id}">${productAttributeInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productAttributeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="productAttribute.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productAttributeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productAttributeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="productAttribute.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productAttributeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productAttributeInstance?.id}" />
					<g:link class="edit" action="edit" id="${productAttributeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
