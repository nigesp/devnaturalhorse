
<%@ page import="dev.thenaturalhorse.co.za.ProductOption" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productOption.label', default: 'ProductOption')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productOption" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productOption" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="price" title="${message(code: 'productOption.price.label', default: 'Price')}" />
					
						<th><g:message code="productOption.product.label" default="Product" /></th>
					
						<th><g:message code="productOption.order.label" default="Order" /></th>
					
						<th><g:message code="productOption.basket.label" default="Basket" /></th>
					
						<g:sortableColumn property="attribute" title="${message(code: 'productOption.attribute.label', default: 'Attribute')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'productOption.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productOptionInstanceList}" status="i" var="productOptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productOptionInstance.id}">${fieldValue(bean: productOptionInstance, field: "price")}</g:link></td>
					
						<td>${fieldValue(bean: productOptionInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: productOptionInstance, field: "order")}</td>
					
						<td>${fieldValue(bean: productOptionInstance, field: "basket")}</td>
					
						<td>${fieldValue(bean: productOptionInstance, field: "attribute")}</td>
					
						<td>${fieldValue(bean: productOptionInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productOptionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
