
<%@ page import="dev.thenaturalhorse.co.za.Contact" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contact" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contact">
			
				<g:if test="${contactInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="contact.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${contactInstance}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="contact.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${contactInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="contact.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${contactInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.cellNumber}">
				<li class="fieldcontain">
					<span id="cellNumber-label" class="property-label"><g:message code="contact.cellNumber.label" default="Cell Number" /></span>
					
						<span class="property-value" aria-labelledby="cellNumber-label"><g:fieldValue bean="${contactInstance}" field="cellNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.landLineNumber}">
				<li class="fieldcontain">
					<span id="landLineNumber-label" class="property-label"><g:message code="contact.landLineNumber.label" default="Land Line Number" /></span>
					
						<span class="property-value" aria-labelledby="landLineNumber-label"><g:fieldValue bean="${contactInstance}" field="landLineNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.emailAddress}">
				<li class="fieldcontain">
					<span id="emailAddress-label" class="property-label"><g:message code="contact.emailAddress.label" default="Email Address" /></span>
					
						<span class="property-value" aria-labelledby="emailAddress-label"><g:fieldValue bean="${contactInstance}" field="emailAddress"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contactInstance?.id}" />
					<g:link class="edit" action="edit" id="${contactInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
