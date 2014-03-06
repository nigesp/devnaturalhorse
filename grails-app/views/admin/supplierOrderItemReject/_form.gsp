<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemDefectInstance, field: 'numItems', 'error')}">error</g:if>">
    <label class="control-label" for="numItems">Number of Defective Items <span>*</span></label>
    <div class="controls">
        <g:textField name="numItems" value="${supplierOrderItemDefectInstance?.numberOfItems}"/>
        <span class="help-inline"><g:fieldError field="numItems" bean="${supplierOrderItemDefectInstance}" /></span>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemDefectInstance, field: 'description', 'error')}">error</g:if>">
    <label class="control-label" for="description">Description <span>*</span></label>
    <div class="controls">
        <g:textArea id="textarea" class="input-xlarge" rows="3" cols="5" name="description" value="${supplierOrderItemDefectInstance?.description}" />
        <span class="help-inline"><g:fieldError field="description" bean="${supplierOrderItemDefectInstance}" /></span>
    </div>
</div>