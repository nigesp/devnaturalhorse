<g:form class="form-horizontal" action="updateProductAttribute" >
    <fieldset>
        <div class="control-group  <g:if test="${hasErrors(bean: productAttributeInstance, field: 'name', 'error')}">error</g:if>">
            <label class="control-label" for="name">Name <span>*</span></label>
            <div class="controls">
                <g:textField name="name" value="${productAttributeInstance?.name}"/>
                <span class="help-inline"><g:fieldError field="name" bean="${productAttributeInstance}" /></span>
            </div>
        </div>
        <g:hiddenField name="productId" value="${productInstance?.id}" />
        <g:hiddenField name="id" value="${productAttributeInstance?.id}" />
        <g:submitButton name="Update" class="btn btn-info" value="Update" />
    </fieldset>
</g:form>