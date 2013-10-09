<div class="control-group  <g:if test="${nameError}">error</g:if>">
    <label class="control-label" for="name">Name <span>*</span></label>
    <div class="controls">
        <g:textField name="name" value="${name}"/>
        <span class="help-inline">${nameError}</span>
    </div>
</div>

<div id="attributeInputs">
    <div class="control-group  <g:if test="${defaultValueError}">error</g:if>">
        <label class="control-label" for="defaultValue">Default Attribute Value <span>*</span></label>
        <div class="controls">
            <g:textField name="defaultValue" value="${defaultValue}"/>
            <span class="help-inline">${defaultValueError}</span>
        </div>
    </div>
</div>

<div class="controls"><a id="anotherAttribute" href="#">Add another attribute value</a></div>

<script type="text/javascript">
    $('#anotherAttribute').live('click', function() {
        $('#attributeInputs').append('<div class="control-group"><div class="controls"><input type="text" name="attributes" value="" id="defaultValue"><span class="help-inline"></span></div></div>');
    });
</script>

<g:hiddenField name="productId" value="${productInstance?.id}"/>

