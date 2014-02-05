<div class="control-group">
    <label class="control-label" for="product">Product <span>*</span></label>
    <div class="controls">
        <g:select name="product" from="${productOptionList}" optionKey="id" optionValue="name" noSelection="${['-1': '-- Select Product --']}"/>
        <span class="help-inline"><g:fieldError field="name" bean="${supplierInstance}" /></span>
    </div>
</div>