<g:each in="${productOptions}" var="productOption" status="i">
    <g:if test ="${productOption?.productOptionAttributes?.size() > 0}">
        <g:set var="hasAttributes" value="${true}" />
    </g:if>
    <g:else>
        <g:set var="hasAttributes" value="${false}" />
    </g:else>
    <div class="control-group">
        <label class="control-label">Product Option ${i + 1}</label>
        <div class="controls">
            <g:if test="${hasAttributes}">
                %{--<g:checkBox class="pull-left" name="productOptionId" value="${productOption?.id}" checked="false" />--}%
                <g:radio class="pull-left" name="productOptionId" value="${productOption?.id}" checked="false"/>
            </g:if>
            <g:else>
                %{--<g:checkBox class="pull-left" name="productOptionId" value="${productOption?.id}" checked="true" />--}%
                <g:radio class="pull-left" name="productOptionId" value="${productOption?.id}" checked="true" />
            </g:else>
            <ul class="pull-left">
                <g:if test ="${hasAttributes}">
                    <g:each in="${productOption?.productOptionAttributes}" var="attribute">
                        <li>${attribute?.attribute?.name}: ${attribute?.value?.value}</li>
                    </g:each>
                </g:if>
                <g:else>
                    There are no options for this product.
                </g:else>
            </ul>
        </div>
    </div>
</g:each>