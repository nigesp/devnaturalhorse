<td>
    <a href="/adminSupplierOrderItem/edit/${orderItemInstance?.id}"><button class="btn btn-mini btn-info">Edit</button></a>
    <button class="btn btn-mini btn-danger" data-toggle="modal" data-target="#deleteSupplierOrderItemModal">Delete</button>
</td>

<!-- Modal -->
<div class="modal fade" id="deleteSupplierOrderItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Delete Supplier Order Item</h4>
            </div>
            <div class="modal-body">
                Are you sure you want to delete the Supplier Order Item:<br/>
                <h3>${orderItemInstance?.productOption?.product?.name}</h3>
                <ul>
                    <g:each in="${orderItemInstance?.productOption?.productOptionAttributes}" var="optionAttribute">
                        <li>${optionAttribute?.attribute?.name} : ${optionAttribute?.value?.value}</li>
                    </g:each>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a href="/adminSupplierOrderItem/delete/${orderItemInstance?.id}"><button type="button" class="btn btn-danger btn-primary">Delete</button></a>
            </div>
        </div>
    </div>
</div>