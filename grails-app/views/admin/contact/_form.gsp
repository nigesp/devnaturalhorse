<%@ page import="dev.thenaturalhorse.co.za.Contact" %>

<div class="control-group">
	<label class="control-label" for="position">
		<g:message code="contact.position.label" default="Position" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls">
        <g:textField class="input-xlarge focused" name="position" required="" value="${contactInstance?.position}"/>
    </div>
</div>

<div class="control-group">
	<label class="control-label"  for="firstName">
		<g:message code="contact.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls">
        <g:textField class="input-xlarge focused" name="firstName" required="" value="${contactInstance?.firstName}"/>
    </div>
</div>

<div class="control-group">
	<label class="control-label"  for="lastName">
		<g:message code="contact.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls">
        <g:textField class="input-xlarge focused" name="lastName" required="" value="${contactInstance?.lastName}"/>
    </div>
</div>

<div class="control-group">
	<label class="control-label"  for="cellNumber">
		<g:message code="contact.cellNumber.label" default="Cell Number" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls">
        <g:textField class="input-xlarge focused" name="cellNumber" required="" value="${contactInstance?.cellNumber}"/>
    </div>
</div>

<div class="control-group">
	<label class="control-label"  for="landLineNumber">
		<g:message code="contact.landLineNumber.label" default="Land Line Number" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls">
        <g:textField class="input-xlarge focused" name="landLineNumber" required="" value="${contactInstance?.landLineNumber}"/>
    </div>
</div>

<div class="control-group">
	<label class="control-label"  for="emailAddress">
		<g:message code="contact.emailAddress.label" default="Email Address" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls">
        <g:field class="input-xlarge focused" type="email" name="emailAddress" required="" value="${contactInstance?.emailAddress}"/>
    </div>
</div>