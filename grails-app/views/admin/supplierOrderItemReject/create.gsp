<%@ page import="dev.thenaturalhorse.co.za.ProductOption" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'productOption.label', default: 'ProductOption')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="secondary-masthead">
    <div class="container">
        <ul class="breadcrumb">
            <li>
                <a href="/adminDashboard/index">Admin</a> <span class="divider">/</span>
            </li>
            <li>
                <a href="#">Shop</a> <span class="divider">/</span>
            </li>
            <li>
                <a href="/adminSupplier/show/${supplierOrderItemInstance?.supplyOrder?.supplier?.id}">${supplierOrderItemInstance?.supplyOrder?.supplier?.name}</a> <span class="divider">/</span>
            </li>
            <li>
                <a href="/adminSupplierOrder/show/${supplierOrderItemInstance?.supplyOrder?.id}">Supplier Order #${supplierOrderItemInstance?.supplyOrder?.id}</a> <span class="divider">/</span>
            </li>
            <li>
                <a href="/adminSupplierOrder/show/${supplierOrderItemInstance?.supplyOrder?.id}">${supplierOrderItemInstance?.productOption?.product?.name}</a> <span class="divider">/</span>
            </li>
            <li class="active">Register defect</li>
        </ul>
    </div>
</div>
<div class="main-area dashboard">
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="page-header">
                    <h1>Register defect - ${supplierOrderItemInstance?.productOption?.product?.name}</h1>
                </div>
            </div>
        </div>
        <div class="span12">
            <div class="slate">
                <g:form class="form-horizontal" action="save" >
                    <fieldset>
                        <g:render template="/admin/supplierOrderItemReject/form"/>
                        <g:hiddenField name="id" value="${supplierOrderItemInstance?.id}" />
                        <g:submitButton name="add" class="btn btn-info" value="Add" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
