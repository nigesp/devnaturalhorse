
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
                    <li class="active">Product Categories</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <g:render template="/common/message" />
                <div class="row">
                    <div class="span12 listing-buttons">
                        <a href="/adminProductCategory/create"><button class="btn btn-success btn-primary">Add New Product Category</button></a>
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
                                <h2>Product Categories</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Number of Products</th>
                                    <th>Last Updated</th>
                                    <th class="actions">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${productCategoryInstanceList}" status="i" var="categoryInstance">
                                    <tr>
                                        <td>
                                            <a href="/adminProductCategory/show/${categoryInstance.id}">${categoryInstance.name}</a>
                                        </td>
                                        <td>${categoryInstance?.products?.size()}</td>
                                        <td>
                                            <span><g:formatDate format="dd MMMM yyyy" date="${categoryInstance?.lastUpdated}"/></span>
                                        </td>
                                        <td class="actions">
                                            %{--<g:form action="delete" method="POST">
                                                <g:hiddenField name="id" value="${categoryInstance.id}" />
                                                <g:submitButton name="delete" value="Delete" class="btn btn-small btn-danger" data-toggle="modal" />
                                            </g:form>--}%
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
