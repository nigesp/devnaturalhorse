<%@ page import="dev.thenaturalhorse.co.za.Contact" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
                    <li class="active">Contact</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Create New Contact</h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <g:form class="form-horizontal" action="save">
                            <fieldset>
                                <g:render template="/admin/contact/form"/>
                                <g:hiddenField name="supplierId" value="${supplierInstance?.id}" />
                                <g:submitButton name="create" class="btn btn-info" value="Create" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
		%{--<a href="#create-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-contact" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="state">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${contactInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contactInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>--}%
	</body>
</html>
