
<%@ page import="dev.thenaturalhorse.co.za.ProductAttributeValue" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productAttributeValue.label', default: 'ProductAttributeValue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productAttributeValue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productAttributeValue" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="value" title="${message(code: 'productAttributeValue.value.label', default: 'Value')}" />
					
						<th><g:message code="productAttributeValue.productAttribute.label" default="Product Attribute" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'productAttributeValue.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'productAttributeValue.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productAttributeValueInstanceList}" status="i" var="productAttributeValueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productAttributeValueInstance.id}">${fieldValue(bean: productAttributeValueInstance, field: "value")}</g:link></td>
					
						<td>${fieldValue(bean: productAttributeValueInstance, field: "productAttribute")}</td>
					
						<td><g:formatDate date="${productAttributeValueInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${productAttributeValueInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productAttributeValueInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
