
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
                        %{--<div class="slate">--}%
                            <div class="row">
                                <div class="span3">
                                    <div class="slate">
                                        <div><g:formatDate format="dd MMM yyyy" date="${supplierOrderInstance?.dateCreated}"/></div>
                                        <div>Date Created</div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="slate">
                                        <div>452</div>
                                        <div>Members</div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="slate">
                                        <div>${supplierOrderInstance?.state}</div>
                                        <div>State</div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="slate">
                                        <g:supplierOrderTotalPrice bean="${supplierOrderInstance}" />
                                        <div>Order Total</div>
                                    </div>
                                </div>
                            </div>
                        %{--</div>--}%
                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        <div class="slate">
                            <div class="page-header">
                                <div class="pull-right">
                                    <a href="/adminSupplierOrderItem/create/${supplierOrderInstance?.id}"><button class="btn btn-success btn-primary">Add product</button></a>
                                </div>
                                <h2>Products</h2>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td>Name</td>
                                        <td>Options</td>
                                        <td>Price Per Item</td>
                                        <td>Num Items</td>
                                        <td>Total Price</td>
                                        <td>Actions</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:if test="${supplierOrderInstance?.items?.size() > 0}">
                                        <g:each in="${supplierOrderInstance?.items}" var="orderItem">
                                            <tr>
                                                <td>${orderItem?.productOption?.product?.name}</td>
                                                <td>
                                                    <g:if test="${orderItem?.productOption?.productOptionAttributes?.size() > 0}">
                                                        <g:each in="${orderItem?.productOption?.productOptionAttributes}" var="optionAttribute">
                                                            ${optionAttribute?.attribute?.name} : ${optionAttribute?.value?.value} <br/>
                                                        </g:each>
                                                    </g:if>
                                                    <g:else>
                                                        -
                                                    </g:else>
                                                </td>
                                                <td>R ${orderItem?.pricePerOption}</td>
                                                <td>${orderItem?.numberOfItems}</td>
                                                <td><g:supplierOrderItemTotalPrice bean="${orderItem}" /></td>
                                                <td>
                                                    <a href="/adminSupplierOrderItem/edit/${orderItem?.id}"><button class="btn btn-mini btn-info">Edit</button></a>
                                                    <button class="btn btn-mini btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                </td>
                                            </tr>
                                            <!-- Modal -->
                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="myModalLabel">Delete Supplier Order Item</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            Are you sure you want to delete the Supplier Order Item:<br/>
                                                            <h3>${orderItem?.productOption?.product?.name}</h3>
                                                            <ul>
                                                                <g:each in="${orderItem?.productOption?.productOptionAttributes}" var="optionAttribute">
                                                                    <li>${optionAttribute?.attribute?.name} : ${optionAttribute?.value?.value}</li>
                                                                </g:each>
                                                            </ul>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            <a href="/adminSupplierOrderItem/delete/${orderItem?.id}"><button type="button" class="btn btn-danger btn-primary">Delete</button></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr><td><p>There are currently no products in this Supplier Order</p></td></tr>
                                    </g:else>
                                </tbody>
                            </table>
                            <g:supplierOrderActionButton bean="${supplierOrderInstance}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
