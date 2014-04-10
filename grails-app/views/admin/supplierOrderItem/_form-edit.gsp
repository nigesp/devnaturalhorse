<div class="control-group">
    <label class="control-label">Product & Options</label>
    <div class="controls">
        <h3>${supplierOrderItemInstance?.productOption?.product?.name}</h3>
        <ul>
            <g:each in="${supplierOrderItemInstance?.productOption?.productOptionAttributes}" var="optionAttribute">
                <li>${optionAttribute?.attribute?.name} : ${optionAttribute?.value?.value}</li>
            </g:each>
        </ul>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'numberOfApprovedItems', 'error')}">error</g:if>">
    <label class="control-label" for="numberOfItems">Number of Items <span>*</span></label>
    <div class="controls">
        <g:textField name="numberOfItems" value="${supplierOrderItemInstance?.numberOfItems}"/>
        <span class="help-inline"><g:fieldError field="numberOfItems" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'pricePerOption', 'error')}">error</g:if>">
    <label class="control-label" for="pricePerOption">Price per Item <span>*</span></label>
    <div class="controls">
        <g:textField name="pricePerOption" value="${supplierOrderItemInstance?.pricePerOption}"/>
        <span class="help-inline"><g:fieldError field="pricePerOption" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>