
<%@ page import="dev.thenaturalhorse.co.za.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
                        <a href="/adminProduct/list">Products</a> <span class="divider">/</span>
                    </li>
                    <li class="active">${productInstance?.name}</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="page-header">
                    <div class="btn-group pull-right">
                        <a href="/adminProduct/edit/${productInstance?.id}"><button class="btn btn-info">Edit</button></a>
                    </div>
                    <h2>${productInstance?.name}</h2>
                </div>
                <div class="row">
                    <div class="span6">
                        <div class="slate">
                            <div class="page-header">
                                <h2>Details</h2>
                            </div>
                            <table class="orders-table table">
                                <tbody>
                                    <tr>
                                        <td><span>Manufacturer</span></td>
                                        <td>${productInstance?.manufacturer}</td>
                                    </tr>
                                    <tr>
                                        <td><span>Image URL</span></td>
                                        <td><a href="${productInstance?.imageUrl}/260.jpg">${productInstance?.imageUrl}</a></td>
                                    </tr>
                                    <tr>
                                        <td><span>Ingredients</span></td>
                                        <td>${productInstance?.ingredients}</td>
                                    </tr>
                                    <tr>
                                        <td><span>Description</span></td>
                                        <td>${productInstance?.description}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="slate">
                            <div class="page-header">
                                <g:if test="${productInstance?.productAttributes?.size() > 0}">
                                    <div class="btn-group pull-right">
                                        <a href="/adminProductOption/create?productId=${productInstance?.id}"><button class="btn btn-success">Add product option</button></a>
                                    </div>
                                </g:if>
                                <h2>Product Options & Inventory</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <g:if test="${productInstance?.productOptions?.size() > 0}">
                                        <g:each in="${productInstance?.productAttributes}" var="attribute">
                                            <td>${attribute?.name}</td>
                                        </g:each>
                                    </g:if>
                                    <td>Num Items</td>
                                    <td>Price</td>
                                    <td>Actions</td>
                                </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${productInstance?.productOptions}" var="option">
                                        <tr>
                                            <g:each in="${option?.productOptionAttributes}" var="attribute">
                                                <td>${attribute?.value?.value}</td>
                                            </g:each>
                                            <td>${option?.numProducts}</td>
                                            <td>R ${option?.price}</td>
                                            <td><a href="#">Edit</a></td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                        <div class="slate">
                            <div class="page-header">
                                <div class="btn-group pull-right">
                                    <a href="/adminProductAttribute/create?productId=${productInstance?.id}"><button class="btn btn-success">Add product attribute</button></a>
                                </div>
                                <h2>Product Attributes</h2>
                            </div>
                            <table class="orders-table table">
                                <tbody>
                                    <g:if test="${productInstance?.productAttributes?.size() > 0}">
                                        <g:each in="${productInstance?.productAttributes}" var="attribute">
                                            <tr>
                                                <td>${attribute?.name}</td>
                                                <td>
                                                    <g:each in="${attribute?.values}" var="val">
                                                        <a href="/adminProductAttributeValue/edit/${val?.id}?productAttributeId=${attribute?.id}&template=value">${val?.value}</a> <br/>
                                                    </g:each>
                                                </td>
                                                <td>
                                                    <a href="/adminProductAttribute/edit/${attribute?.id}?productId=${productInstance?.id}&template=attribute"><button class="btn btn-mini btn-info">Edit Name</button></a>
                                                    <a href="/adminProductAttributeValue/create/${attribute?.id}"><button class="btn btn-mini btn-info">Add Value</button></a>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr>
                                            <td>There are currently no attributes for this product.</td>
                                        </tr>
                                    </g:else>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="span6">
                        <div class="slate">
                            <div class="page-header">
                                <h2>Images</h2>
                            </div>
                            <div class="adminProductImage">
                                <img src="${productInstance?.imageUrl}/260.jpg"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
