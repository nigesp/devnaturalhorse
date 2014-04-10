<%@ page import="dev.thenaturalhorse.co.za.Contact" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="secondary-masthead">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a href="adminDashboard">Admin</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">Shop</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="/adminSupplier/list">Suppliers</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="/adminSupplier/show/${supplierInstance?.id}">${supplierInstance?.name}</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Edit</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Edit - ${contactInstance?.firstName} ${contactInstance?.lastName}</h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <a href="#" class="btn btn-default">Cancel</a>
                        <g:form class="form-horizontal" action="update" >
                            <fieldset>
                                <g:render template="/admin/contact/form"/>
                                <g:hiddenField name="id" value="${contactInstance?.id}" />
                                <g:hiddenField name="version" value="${contactInstance?.version}" />
                                <g:hiddenField name="supplierId" value="${supplierInstance?.id}" />
                                <g:submitButton name="update" class="btn btn-info" value="Update" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
