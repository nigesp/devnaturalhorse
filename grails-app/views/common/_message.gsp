<g:if test="${flash?.message}">
    <div class="alert ${flash?.messageType}">
        <a class="close" data-dismiss="alert" href="#">x</a>
        <h4 class="alert-heading">${flash?.messageHeading}</h4>
        ${flash?.message}
    </div>
</g:if>