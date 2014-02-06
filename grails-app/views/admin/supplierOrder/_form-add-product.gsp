<div class="control-group">
    <label class="control-label" for="product">Product <span>*</span></label>
    <div class="controls">
        <g:select name="product" from="${productList}" optionKey="id" optionValue="name" noSelection="${['-1': '-- Select Product --']}" onchange="${remoteFunction(action: 'productOptionsForProduct', update: [success: 'productOptions'], params: '\'id=\' + this.value')}"/>
    </div>
</div>

<div id="productOptions"></div>
