<td>
    <button class="btn btn-mini btn-success" data-toggle="modal" data-target="#allItemsOkModal">All OK</button>
    <a href="/adminSupplierOrderItem/showCaptureRejects/${orderItemInstance?.id}"><button class="btn btn-mini btn-danger">Defects</button></a>
</td>

<!-- Modal -->
<div class="modal fade" id="allItemsOkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">All items OK!</h4>
            </div>
            <div class="modal-body">
                All items are good to be placed into the shop.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <g:form class="inline" controller="adminSupplierOrderItem" action="noRejects">
                    <g:hiddenField name="id" value="${orderItemInstance?.id}" />
                    <g:submitButton class="btn btn-default btn-success" name="All OK"/>
                </g:form>
            </div>
        </div>
    </div>
</div>