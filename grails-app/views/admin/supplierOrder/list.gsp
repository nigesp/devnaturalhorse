
<%@ page import="dev.thenaturalhorse.co.za.ProductCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
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
                    <li class="active">Supplier Orders</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <g:if test="${flash?.message}">
                    <div class="alert ${flash?.messageType}">
                        <a class="close" data-dismiss="alert" href="#">x</a>
                        <h4 class="alert-heading">${flash?.messageHeading}</h4>
                        ${flash?.message}
                    </div>
                </g:if>
                <div class="row">
                    <div class="span12 listing-buttons">
                        <a href="/adminSupplierOrder/create"><button class="btn btn-success btn-primary">Create New Supplier Order</button></a>
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
                                <h2>Supplier Orders</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <th>Supplier</th>
                                    <th>Date Last Modified</th>
                                    <th>Total</th>
                                    <th>State</th>
                                    <th class="actions">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${supplierOrderList}" status="i" var="supplierOrderInstance">
                                    <tr>
                                        <td>${supplierOrderInstance?.supplier?.name}</td>
                                        <td>
                                            <span><g:formatDate format="dd MMMM yyyy" date="${supplierOrderInstance?.lastUpdated}"/></span>
                                        </td>
                                        <td>${supplierOrderInstance?.state?.name()}</td>
                                        <td class="actions">
                                            <a class="btn btn-small btn-danger" data-toggle="modal" href="/adminProductCategory/delete/${categoryInstance.id}">Delete</a>
                                            <a class="btn btn-small btn-primary" href="/adminProductCategory/show/${categoryInstance.id}">View</a>
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
	</body>
</html>
