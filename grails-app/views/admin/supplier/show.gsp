<%@ page import="dev.thenaturalhorse.co.za.Supplier" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
                        <a href="/adminSupplier/list">Suppliers</a> <span class="divider">/</span>
                    </li>
                    <li class="active">${supplierInstance?.name}</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="page-header">
                    <div class="btn-group pull-right">
                        <a href="/adminSupplier/edit/${supplierInstance?.id}"><button class="btn btn-info">Edit</button></a>
                    </div>
                    <h2>${supplierInstance?.name}</h2>
                </div>
                <div class="row">
                    <div class="span6">
                        <div class="slate">
                            <div class="page-header">
                                <h2>Stats</h2>
                            </div>
                            <table class="orders-table table">
                                <tbody>
                                    <tr>
                                        <td><span>Products Sold</span></td>
                                        <td>22</td>
                                    </tr>
                                    <tr>
                                        <td><span>Products In Stock</span></td>
                                        <td>17</td>
                                    </tr>
                                    <tr>
                                        <td><span>Last Order</span></td>
                                        <td>24-09-2013</td>
                                    </tr>
                                    <tr>
                                        <td><span>Defective Produts</span></td>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td><span>Number of days for delivery</span></td>
                                        <td>2</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="slate">
                            <div class="page-header">
                                <div class="pull-right">
                                    <a href="/adminSupplierOrder/create/${supplierInstance?.id}"><button class="btn btn-success btn-primary">Create new supply order</button></a>
                                </div>
                                <h2>Supplier Orders</h2>
                            </div>
                            <table class="orders-table table">
                                <thead>
                                    <tr>
                                        <td>Date Created</td>
                                        <td>Order Size</td>
                                        <td>Status</td>
                                        <td>Actions</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:if test="${supplierInstance?.supplyOrders?.size() > 0}">
                                        <g:each in="${supplierInstance?.supplyOrders}" var="order">
                                            <tr>
                                                <td><g:formatDate format="dd MMM yyyy" date="${order?.dateCreated}"/></td>
                                                <td><g:supplierOrderTotalItems bean="${order}" /></td>
                                                <td>
                                                    <g:supplyOrderState bean="${order}" />
                                                </td>
                                                <td>
                                                    <a href="/adminSupplierOrder/show/${order?.id}"><button class="btn btn-mini btn-info">View</button></a>
                                                    %{--<g:supplyOrderButton bean="${order}" />--}%
                                                </td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr><td>No orders have been made to this supplier.</td></tr>
                                    </g:else>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="slate">
                            <div class="page-header">
                                <div class="pull-right">
                                    <a href="/adminProduct/create"><button class="btn btn-success btn-primary">Add Product</button></a>
                                </div>
                                <h2>Products</h2>
                            </div>
                            <table class="orders-table table">
                                <tbody>
                                    <g:if test="${supplierInstance?.products?.size() > 0}">
                                        <g:each in="${supplierInstance?.products}" var="product">
                                            <tr>
                                                <td><a href="/adminProduct/show/${product?.id}">${product?.name}</a></td>
                                                %{--<td>${product?.totalItems}</td>--}%
                                            </tr>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr>This supplier currently has no products.</tr>
                                    </g:else>
                                </tbody>
                            </table>
                        </div>
                        <div class="slate">
                            <div class="page-header">
                                <div class="pull-right">
                                    <a href="/adminContact/create?supplierId=${supplierInstance?.id}"><button class="btn btn-success btn-primary">Add Contact</button></a>
                                </div>
                                <h2>Contacts</h2>
                            </div>
                            <g:if test="${supplierInstance?.contacts?.size() > 0}">
                                <g:each in="${supplierInstance?.contacts}" var="contact">
                                    <table class="orders-table table">
                                        <tbody>
                                        <tr>
                                            <td><h3>${contact?.firstName} ${contact?.lastName}</h3></td>
                                            <td>
                                                <a href="/adminContact/edit/${contact?.id}?supplierId=${supplierInstance?.id}"><button class="btn btn-mini btn-info">Edit</button></a>
                                                <a data-toggle="modal" href="#myModal_${contact?.id}" class="btn btn-mini btn-danger">Delete</a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="myModal_${contact?.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                <h4 class="modal-title">Delete</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                Are you sure you'd like to delete the contact:<br/>
                                                                <h3>${contact?.firstName} ${contact?.lastName} - ${contact?.position}</h3>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                %{--<a href="/adminContact/delete/${contact.id}?supplierId=${supplierInstance?.id}"><button type="button" class="btn btn-warning">Delete</button></a>--}%
                                                                <g:form class="pull-right" controller="adminContact" action="delete" method="post">
                                                                    <g:hiddenField name="supplierId" value="${supplierInstance?.id}"/>
                                                                    <g:hiddenField name="id" value="${contact?.id}"/>
                                                                    <g:submitButton id="contactDeleteButton" class="btn btn-warning" name="Delete" />
                                                                </g:form>
                                                            </div>
                                                        </div><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                                </div><!-- /.modal -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Position</td>
                                            <td>${contact?.position}</td>
                                        </tr>
                                        <tr>
                                            <td>Landline number</td>
                                            <td>${contact?.landLineNumber}</td>
                                        </tr>
                                        <tr>
                                            <td>Cell number</td>
                                            <td>${contact?.cellNumber}</td>
                                        </tr>
                                        <tr>
                                            <td>Email address</td>
                                            <td>${contact?.emailAddress}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </g:each>
                            </g:if>
                            <g:else>
                                <table class="orders-table table">
                                    <tbody>
                                        <tr>This supplier current has no contacts.</tr>
                                    </tbody>
                                </table>
                            </g:else>
                        </div>
                    </div>
                </div>
                %{--<a href="#show-supplier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
                <div id="show-supplier" class="content scaffold-show" role="main">
                    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="state">${flash.message}</div>
                    </g:if>
                    <ol class="property-list supplier">

                        <g:if test="${supplierInstance?.name}">
                        <li class="fieldcontain">
                            <span id="name-label" class="property-label"><g:message code="supplier.name.label" default="Name" /></span>

                                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${supplierInstance}" field="name"/></span>

                        </li>
                        </g:if>

                        <g:if test="${supplierInstance?.product}">
                        <li class="fieldcontain">
                            <span id="product-label" class="property-label"><g:message code="supplier.product.label" default="Product" /></span>

                                <g:each in="${supplierInstance.product}" var="p">
                                <span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                                </g:each>

                        </li>
                        </g:if>

                        <g:if test="${supplierInstance?.supplyOrders}">
                        <li class="fieldcontain">
                            <span id="supplyOrders-label" class="property-label"><g:message code="supplier.supplyOrders.label" default="Supply Orders" /></span>

                                <g:each in="${supplierInstance.supplyOrders}" var="s">
                                <span class="property-value" aria-labelledby="supplyOrders-label"><g:link controller="supplyOrder" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
                                </g:each>

                        </li>
                        </g:if>

                        <g:if test="${supplierInstance?.dateCreated}">
                        <li class="fieldcontain">
                            <span id="dateCreated-label" class="property-label"><g:message code="supplier.dateCreated.label" default="Date Created" /></span>

                                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${supplierInstance?.dateCreated}" /></span>

                        </li>
                        </g:if>

                        <g:if test="${supplierInstance?.lastUpdated}">
                        <li class="fieldcontain">
                            <span id="lastUpdated-label" class="property-label"><g:message code="supplier.lastUpdated.label" default="Last Updated" /></span>

                                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${supplierInstance?.lastUpdated}" /></span>

                        </li>
                        </g:if>

                    </ol>
                    <g:form>
                        <fieldset class="buttons">
                            <g:hiddenField name="id" value="${supplierInstance?.id}" />
                            <g:link class="edit" action="edit" id="${supplierInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>--}%
            </div>
        </div>
	</body>
</html>
