
<%@ page import="dev.thenaturalhorse.co.za.Contact" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="secondary-masthead">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a href="adminDashboard">Admin</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">Shop</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="/adminSupplier/list">Suppliers</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Contacts</li>
                </ul>
            </div>
        </div>

        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12 listing-buttons">
                        <a href="/adminContact/create"><button class="btn btn-success btn-primary">Add New Contact</button></a>
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
                                <h2>Contacts</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Delivery Time (days)</th>
                                    <th>Num Products</th>
                                    <th class="actions">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
                                    <tr>
                                        <td>
                                            <a href="/adminSupplier/show/${supplierInstance.id}">${supplierInstance.name}</a>
                                        </td>
                                        <td>
                                            <span>${supplierInstance.daysFromOrderToDelivery}</span>
                                        </td>
                                        <td>
                                            <span>${supplierInstance?.products?.size()}</span>
                                        </td>
                                        <td class="actions">
                                            <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
                                            <a class="btn btn-small btn-primary" href="/adminSupplier/show/${supplierInstance.id}">View</a>
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

		%{--<a href="#list-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contact" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="state">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="position" title="${message(code: 'contact.position.label', default: 'Position')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="cellNumber" title="${message(code: 'contact.cellNumber.label', default: 'Cell Number')}" />
					
						<g:sortableColumn property="landLineNumber" title="${message(code: 'contact.landLineNumber.label', default: 'Land Line Number')}" />
					
						<g:sortableColumn property="emailAddress" title="${message(code: 'contact.emailAddress.label', default: 'Email Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactInstanceList}" state="i" var="contactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "position")}</g:link></td>
					
						<td>${fieldValue(bean: contactInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "cellNumber")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "landLineNumber")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "emailAddress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactInstanceTotal}" />
			</div>
		</div>--}%
	</body>
</html>
