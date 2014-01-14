<div class="control-group <g:if test="${hasAttributeError}">error</g:if>">
    <label class="control-label" for="attribute">${attribute?.name} <span>*</span></label>
    <div class="controls">
        <g:select id="attribute" name="attributeValueId" from="${attribute?.values}" optionKey="id" optionValue="value" noSelection="['-1':'-- Select Value --']"/>
        <g:if test="${hasAttributeError}"><span class="help-inline">Please select a value for all attributes.</span></g:if>
    </div>
</div>