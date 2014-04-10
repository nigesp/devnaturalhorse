<button type="button" class="btn btn-info btn-primary" data-toggle="modal" data-target="#processModal">Process order!</button>

<!-- Modal -->
<div class="modal fade" id="processModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Process Order</h4>
            </div>
            <div class="modal-body">
                <h3>Are you sure you would like to process this order now?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a href="/adminSupplierOrder/process/${supplierOrderInstance?.id}"><button type="button" class="btn btn-info btn-primary">Yes</button></a>
            </div>
        </div>
    </div>
</div>