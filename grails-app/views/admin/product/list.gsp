
<%@ page import="dev.thenaturalhorse.co.za.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
                    <li class="active">Products</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12 listing-buttons">
                        <a href="/adminProduct/create"><button class="btn btn-success btn-primary">Add New Product</button></a>
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
                                <h2>Suppliers</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Supplier</th>
                                    <th>Num Product Items</th>
                                    <th class="actions">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${productInstanceList}" status="i" var="productInstance">
                                    <tr>
                                        <td>
                                            <a href="/adminProduct/show/${productInstance.id}">${productInstance?.name}</a>
                                        </td>
                                        <td>
                                            <span>${productInstance?.supplier?.name}</span>
                                        </td>
                                        <td>
                                            <span>${productInstance?.productItems?.size()}</span>
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
		%{--<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-product" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="manufacturer" title="${message(code: 'product.manufacturer.label', default: 'Manufacturer')}" />
					
						<g:sortableColumn property="imageUrl" title="${message(code: 'product.imageUrl.label', default: 'Image Url')}" />
					
						<g:sortableColumn property="ingredients" title="${message(code: 'product.ingredients.label', default: 'Ingredients')}" />
					
						<th><g:message code="product.category.label" default="Category" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: productInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "manufacturer")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "imageUrl")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "ingredients")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "category")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productInstanceTotal}" />
			</div>
		</div>--}%
	</body>
</html>
