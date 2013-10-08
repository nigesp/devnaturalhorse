
<%@ page import="dev.thenaturalhorse.co.za.ProductAttribute" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'productAttribute.label', default: 'ProductAttribute')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="secondary-masthead">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Admin</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">Shop</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="/adminProduct/show/${productInstance?.id}">${productInstance?.name}</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Product Attributes</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12 listing-buttons">
                        <a href="/adminProductAtribute/create"><button class="btn btn-success btn-primary">Add New Product Attribute</button></a>
                    </div>
                    <div class="span12">
                        <div class="slate">
                            <div class="page-header">
                                <div class="btn-group pull-right">
                                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                                        <i class="icon-download-alt"></i> Export <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">CSV</a></li>
                                        <li><a href="">Excel</a></li>
                                        <li><a href="">PDF</a></li>
                                    </ul>
                                </div>
                                <h2>${productInstance?.name} Attributes</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Attributes</th>
                                    <th class="actions">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${productAttributeInstanceList}" status="i" var="productAttributeInstance">
                                    <tr>
                                        <td>
                                            <a href="/adminProductAttribute/show/${productAttributeInstance?.id}">${productAttributeInstance?.name}</a>
                                        </td>
                                        <td>
                                            <span>${productInstance?.supplier?.name}</span>
                                        </td>
                                        <td class="actions">
                                            <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
                                            <a class="btn btn-small btn-primary" href="/adminProduct/show/${productInstance.id}">View</a>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<a href="#list-productAttribute" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productAttribute" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'productAttribute.name.label', default: 'Name')}" />
					
						<th><g:message code="productAttribute.product.label" default="Product" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'productAttribute.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'productAttribute.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productAttributeInstanceList}" status="i" var="productAttributeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productAttributeInstance.id}">${fieldValue(bean: productAttributeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: productAttributeInstance, field: "product")}</td>
					
						<td><g:formatDate date="${productAttributeInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${productAttributeInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productAttributeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
