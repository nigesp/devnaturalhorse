<div class="control-group">
    <label class="control-label" for="product">Product <span>*</span></label>
    <div class="controls">
        <g:select name="product" from="${productList}" optionKey="id" optionValue="name" noSelection="${['-1': '-- Select Product --']}" onchange="${remoteFunction(action: 'productOptionsForProduct', update: [success: 'productOptions'], params: '\'id=\' + this.value')}"/>
    </div>
</div>

<div id="productOptions"></div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'numItems', 'error')}">error</g:if>">
    <label class="control-label" for="numItems">Number of Items <span>*</span></label>
    <div class="controls">
        <g:textField name="numItems" value="${supplierOrderItemInstance?.numItems}"/>
        <span class="help-inline"><g:fieldError field="numItems" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>

<div class="control-group  <g:if test="${hasErrors(bean: supplierOrderItemInstance, field: 'pricePerOption', 'error')}">error</g:if>">
    <label class="control-label" for="pricePerOption">Price per Item <span>*</span></label>
    <div class="controls">
        <g:textField name="pricePerOption" value="${supplierOrderItemInstance?.numItems}"/>
        <span class="help-inline"><g:fieldError field="pricePerOption" bean="${supplierOrderItemInstance}" /></span>
    </div>
</div>
