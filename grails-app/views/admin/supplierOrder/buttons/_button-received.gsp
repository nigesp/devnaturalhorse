<button type="button" class="btn btn-info btn-primary" data-toggle="modal" data-target="#receivedModal">Order Received</button>

<!-- Modal -->
<div class="modal fade" id="receivedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Order received</h4>
            </div>
            <div class="modal-body">
                <h3>Order received <g:formatDate format="dd MMM yyyy" date="${now}"/></h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a href="/adminSupplierOrder/received/${supplierOrderInstance?.id}"><button type="button" class="btn btn-info btn-primary">Submit</button></a>
            </div>
        </div>
    </div>
</div>