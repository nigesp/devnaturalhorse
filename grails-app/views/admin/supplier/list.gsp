
<%@ page import="dev.thenaturalhorse.co.za.Supplier" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
                    <li class="active">Suppliers</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12 listing-buttons">
                        <a href="/adminSupplier/create"><button class="btn btn-success btn-primary">Add New Supplier</button></a>
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
	</body>
</html>
