<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'productOption', 'error')}">error</g:if>">
    <label class="control-label" for="product">Product <span>*</span></label>
    <div class="controls">
        <g:select name="product" from="${productList}" optionKey="id" optionValue="name" noSelection="${['-1': '-- Select Product --']}" onchange="${remoteFunction(action: 'productOptionsForProduct', update: [success: 'productOptions'], params: '\'id=\' + this.value')}"/>
        <span class="help-inline"><g:fieldError field="productOption" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>

<div id="productOptions"></div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'numberOfItems', 'error')}">error</g:if>">
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
