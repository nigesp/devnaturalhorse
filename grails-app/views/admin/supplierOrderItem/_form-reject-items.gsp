<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'numberOfRejectItems', 'error')}">error</g:if>">
    <label class="control-label" for="numberOfRejectItems">Number of Rejected Items <span>*</span></label>
    <div class="controls">
        <g:textField name="numberOfRejectItems" value="${supplierOrderItemInstance?.numberOfRejectItems}"/>
        <span class="help-inline"><g:fieldError field="numberOfRejectItems" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'rejectionReason', 'error')}">error</g:if>">
    <label class="control-label" for="rejectionReason">Reason(s) for rejecting these items <span>*</span></label>
    <div class="controls">
        <g:textArea name="rejectionReason" value="${supplierOrderItemInstance?.rejectionReason}" cols="5"  rows="3"/>
        <span class="help-inline"><g:fieldError field="rejectionReason" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>