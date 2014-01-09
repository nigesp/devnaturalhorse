<g:form class="form-horizontal" action="update" >
    <fieldset>
        <div class="control-group  <g:if test="${hasErrors(bean: productAttributeInstance, field: 'name', 'error')}">error</g:if>">
            <label class="control-label" for="name">Name <span>*</span></label>
            <div class="controls">
                <g:textField name="name" value="${productAttributeInstance?.name}"/>
                <span class="help-inline"><g:fieldError field="name" bean="${productAttributeInstance}" /></span>
            </div>
        </div>

        <g:if test="${productAttributeInstance?.values?.size() > 0}">
            <g:each in="${productAttributeInstance?.values}" var="value" status="loop">
                <g:if test="${loop == 0}">
                    <div id="attributeInputs">
                        <div class="control-group  <g:if test="${hasErrors(bean: productAttributeInstance, field: 'values', 'error')}">error</g:if>">
                            <label class="control-label" for="values">Values <span>*</span></label>
                            <div class="controls">
                                <g:textField name="values" value="${value}"/>
                                <span class="help-inline"><g:fieldError field="values" bean="${productAttributeInstance}" /></span>
                            </div>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class="control-group">
                        <div class="controls">
                            <input type="text" name="values" value="${value}" id="defaultValue">
                            <span class="help-inline"></span>
                        </div>
                    </div>
                </g:else>
            </g:each>
        </g:if>
        <g:else>
            <div id="attributeInputs">
                <div class="control-group  <g:if test="${hasErrors(bean: productAttributeInstance, field: 'values', 'error')}">error</g:if>">
                    <label class="control-label" for="values">
                        <g:if test="${createNewAttribute}">Default Value </g:if>
                        <g:else>Values </g:else>
                        <span>*</span>
                    </label>
                    <div class="controls">
                        <g:textField name="values"/>
                        <span class="help-inline"><g:fieldError field="values" bean="${productAttributeInstance}" /></span>
                    </div>
                </div>
            </div>
        </g:else>

        <g:if test="${!createNewAttribute}">
            <div class="controls"><a id="anotherAttribute" href="#">Add another attribute value</a></div>
        </g:if>

        <script type="text/javascript">
            $('#anotherAttribute').live('click', function() {
                $('#attributeInputs').append('<div class="control-group"><div class="controls"><input type="text" name="values" value="" id="defaultValue"><span class="help-inline"></span></div></div>');
            });
        </script>

        <g:hiddenField name="productId" value="${productInstance?.id}"/>
        <g:hiddenField name="productId" value="${productInstance?.id}" />
        <g:hiddenField name="id" value="${productAttributeInstance?.id}" />
        <g:submitButton name="Update" class="btn btn-info" value="Update" />
    </fieldset>
</g:form>

