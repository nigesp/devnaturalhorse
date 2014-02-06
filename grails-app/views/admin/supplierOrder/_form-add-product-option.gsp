<g:each in="${productOptions}" var="productOption" status="i">
    <div class="control-group">
        <label class="control-label">Product Option #${i}</label>
        <div class="controls">
            <g:checkBox class="pull-left" name="productOptionId" value="${productOption?.id}" checked="false" />
            <ul class="pull-left">
                <g:each in="${productOption?.productOptionAttributes}" var="attribute">
                    <li>${attribute?.attribute?.name}: ${attribute?.value?.value}</li>
                </g:each>
            </ul>
        </div>
    </div>
</g:each>