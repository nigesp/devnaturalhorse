<button type="button" class="btn btn-info btn-primary" data-toggle="modal" data-target="#submitToSupplierModal">Submit to Supplier</button>

<!-- Modal -->
<div class="modal fade" id="submitToSupplierModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Submit order to ${supplierOrderInstance?.supplier?.name}</h4>
            </div>
            <div class="modal-body">
                Are you sure you want to submit this order to ${supplierOrderInstance?.supplier?.name}:<br/>
                <ul>
                    <g:each in="${supplierOrderInstance?.items}" var="item">
                        <h3>${item?.totalNumberOfItems} x ${item?.productOption?.product?.name}:</h3>
                        <ul>
                            <g:if test="${item?.productOption?.productOptionAttributes?.size() > 0}">
                                <g:each in="${item?.productOption?.productOptionAttributes}" var="attribute">
                                    <li>${attribute?.attribute?.name} : ${attribute?.value?.value}</li>
                                </g:each>
                            </g:if>
                            <g:else>
                                <li>Product has no attributes.</li>
                            </g:else>
                        </ul>
                    </g:each>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a href="/adminSupplierOrder/submitToSupplier/${supplierOrderInstance?.id}"><button type="button" class="btn btn-info btn-primary">Submit</button></a>
            </div>
        </div>
    </div>
</div>