<div class="fieldcontain ${hasErrors(bean: productOptionInstance, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="productOption.value.label" default="Value" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="attribute" from="${attributeValues}" optionKey="id" optionValue="name" />
</div>