
<%@ page import="dev.thenaturalhorse.co.za.ProductCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<title>Admin - Supplier Order</title>
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
                        <a href="/adminSupplier/show/${supplierOrderInstance?.supplier?.id}">${supplierOrderInstance?.supplier?.name}</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Supplier Order</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="page-header">
                    <h2>Supplier Order - ${supplierOrderInstance?.supplier?.name}</h2>
                </div>
                <div class="row">
                    <div class="span12">
                        <div class="slate">
                            <div class="page-header">
                                <h2>Details</h2>
                            </div>
                            <p>State : ${supplierOrderInstance?.state}</p>
                            <div class="page-header">
                                <h2>Products</h2>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td>Name</td>
                                        <td>Options</td>
                                        <td>Price</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:if test="${supplierOrderInstance?.items?.size() > 0}">
                                        <g:each in="${supplierOrderInstance?.items}" var="productOption">
                                            <tr>
                                                <td>${productOption?.product?.name}</td>
                                                <td>
                                                    <g:each in="${productOption?.productOptionAttributes}" var="optionAttribute">
                                                        ${optionAttribute?.attribute?.name} : ${optionAttribute?.value?.value} <br/>
                                                    </g:each>
                                                </td>
                                                <td>${productOption?.pricePerOption}</td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr><td><p>There are currently no products in this Supplier Order</p></td></tr>
                                    </g:else>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
