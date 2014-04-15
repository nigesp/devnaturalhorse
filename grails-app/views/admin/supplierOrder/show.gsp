
<%@ page import="dev.thenaturalhorse.co.za.enums.SupplyOrderState; dev.thenaturalhorse.co.za.ProductCategory" %>
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
                <g:render template="/common/message" />
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
                                    <g:if test="${supplierOrderInstance?.state == dev.thenaturalhorse.co.za.enums.SupplyOrderState.OPEN}">
                                        <a href="/adminSupplierOrderItem/create/${supplierOrderInstance?.id}"><button class="btn btn-success btn-primary">Add product</button></a>
                                    </g:if>
                                </div>
                                <h2>Products</h2>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td>Name</td>
                                        <td>Options</td>
                                        <td>Price Per Item</td>
                                        <g:if test="${supplierOrderInstance?.state == SupplyOrderState.RECEIVED}">
                                            <td>Num Approved</td>
                                            <td>Num Rejected</td>
                                        </g:if>
                                        <td>Total Items</td>
                                        <td>Total Price</td>
                                        <g:if test="${supplierOrderInstance?.state == dev.thenaturalhorse.co.za.enums.SupplyOrderState.OPEN || supplierOrderInstance?.state == dev.thenaturalhorse.co.za.enums.SupplyOrderState.RECEIVED}">
                                            <td>Actions</td>
                                        </g:if>
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
                                                <g:if test="${supplierOrderInstance?.state == SupplyOrderState.RECEIVED}">
                                                    <td>
                                                        <g:if test="${orderItem?.numberOfApprovedItems}">${orderItem?.numberOfApprovedItems}</g:if>
                                                        <g:else>-</g:else>
                                                    </td>
                                                    <td>
                                                        <g:if test="${orderItem?.numberOfRejectItems}">${orderItem?.numberOfRejectItems}</g:if>
                                                        <g:else>-</g:else>
                                                    </td>
                                                </g:if>
                                                <td>${orderItem?.totalNumberOfItems}</td>
                                                <td><g:supplierOrderItemTotalPrice bean="${orderItem}" /></td>
                                                <g:supplyOrderItemActionButton bean="${orderItem}" />
                                            </tr>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr><td colspan="6"><p>There are currently no products in this Supplier Order</p></td></tr>
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
