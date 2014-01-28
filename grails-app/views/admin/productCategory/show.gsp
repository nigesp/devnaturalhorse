
<%@ page import="dev.thenaturalhorse.co.za.ProductCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
                        <a href="/adminProductCategory/list">Product Categories</a> <span class="divider">/</span>
                    </li>
                    <li class="active">${productCategoryInstance?.name}</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="page-header">
                    <div class="btn-group pull-right">
                        <a href="/adminProductCategory/edit/${productCategoryInstance?.id}"><button class="btn btn-info">Edit</button></a>
                    </div>
                    <h2>${productCategoryInstance?.name} (${productCategoryInstance?.products?.size()})</h2>
                </div>
                <div class="row">
                    <div class="span12">
                        <div class="slate">
                            <div class="page-header">
                                <h2>Description</h2>
                            </div>
                            <p>${productCategoryInstance?.description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
