<%@ page import="dev.thenaturalhorse.co.za.Supplier" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
                        <a href="/adminSupplier/list">Suppliers</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Create</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Create New Supplier</h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <g:form class="form-horizontal" action="save" >
                            <fieldset>
                                <g:render template="/admin/supplier/form"/>
                                <g:submitButton name="create" class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
