package dev.thenaturalhorse.co.za

import dev.thenaturalhorse.co.za.enums.SupplyOrderState

class AdminSupplierOrderItemController {

    def create() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        if(order.state != SupplyOrderState.OPEN) {
            flash.message = message(code: 'supplierOrder.wrong.state', args: [order?.id, 'OPEN', 'add products to it'])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminSupplier', action: 'show', id: order?.supplier?.id)
            return
        }

        render(view: '/admin/supplierOrderItem/create', model: [supplierOrderInstance: order, productList: order?.supplier?.products, actionName: 'addProduct'])
    }

    def save() {
        SupplierOrder order = SupplierOrder.findById(params?.id)

        if (!order) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        if(order.state != SupplyOrderState.OPEN) {
            flash.message = message(code: 'supplierOrder.wrong.state', args: [order?.id, 'OPEN', 'add products to it'])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminSupplier', action: 'show', id: order?.supplier?.id)
            return
        }

        SupplierOrderItem orderItem = new SupplierOrderItem()
        if (params?.totalNumberOfItems) {
            orderItem.totalNumberOfItems = params.int('totalNumberOfItems')
        }
        if (params?.pricePerOption) {
            orderItem.pricePerOption = new BigDecimal(params?.pricePerOption)
        }
        if (params?.productOptionId) {
            orderItem.productOption = ProductOption?.findById(params?.productOptionId)
        }
        orderItem.supplyOrder = order
        orderItem.numberOfRejectItems = 0

        orderItem.validate()

        if (orderItem.hasErrors()) {
            orderItem.errors.each {
                println it
            }
            render(view: '/admin/supplierOrderItem/create', model: [supplierOrderInstance: order, supplierOrderItemInstance: orderItem, productList: order?.supplier?.products])
            return
        }

        order.addToItems(orderItem)
        order.save(flush: true)

        redirect(controller: 'adminSupplierOrder', action: 'show', id: order?.id)
    }

    def edit() {
        SupplierOrderItem supplierOrderItemInstance = SupplierOrderItem.findById(params?.id)

        if (!supplierOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        render(view: '/admin/supplierOrderItem/edit', model: [supplierOrderItemInstance: supplierOrderItemInstance])
    }

    def update() {
        SupplierOrderItem supplierOrderItemInstance = SupplierOrderItem.findById(params?.id)

        if (!supplierOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        if (params?.numberOfItems) {
            supplierOrderItemInstance.numberOfApprovedItems = params.int('numberOfApprovedItems')
        } else {
            supplierOrderItemInstance.numberOfApprovedItems = 0
        }
        if (params?.pricePerOption) {
            supplierOrderItemInstance.pricePerOption = new BigDecimal(params?.pricePerOption)
        } else {
            supplierOrderItemInstance.pricePerOption = null
        }

        if (!supplierOrderItemInstance.save(flush: true)) {
            supplierOrderItemInstance.errors.each {
                println(it)
            }
            render(view: '/admin/supplierOrderItem/edit', model: [supplierOrderItemInstance: supplierOrderItemInstance])
            return
        }

        redirect(controller: 'adminSupplierOrder', action: 'show', id: supplierOrderItemInstance?.supplyOrder?.id)
    }

    def noRejects() {
        SupplierOrderItem supplierOrderItemInstance = SupplierOrderItem.findById(params?.id)

        if (!supplierOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        supplierOrderItemInstance.processed = true
        supplierOrderItemInstance.numberOfApprovedItems = supplierOrderItemInstance.totalNumberOfItems
        supplierOrderItemInstance.numberOfRejectItems = 0

        redirect(controller: 'adminSupplierOrder', action: 'show', id: supplierOrderItemInstance?.supplyOrder?.id)
    }

    def showCaptureRejects() {
        SupplierOrderItem supplierOrderItemInstance = SupplierOrderItem.findById(params?.id)

        if (!supplierOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        render(view: '/admin/supplierOrderItem/reject-item', model: [supplierOrderItemInstance: supplierOrderItemInstance])
    }

    def captureRejects() {
        SupplierOrderItem supplierOrderItemInstance = SupplierOrderItem.findById(params?.id)

        if (!supplierOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        if(!params?.numberOfRejectItems) {
            supplierOrderItemInstance?.errors?.rejectValue("numberOfRejectItems", "numberOfRejectItems", "Please enter number of rejected items")
        } else {
            int numRejects = params.int("numberOfRejectItems")
            if (numRejects > supplierOrderItemInstance?.totalNumberOfItems) {
                supplierOrderItemInstance?.errors?.rejectValue("numberOfRejectItems", "numberOfRejectItems", "Cannot register more defects than items in this order.")
            }
        }

        if (!params?.rejectionReason) {
            supplierOrderItemInstance?.errors?.rejectValue("rejectionReason", "rejectionReason", "Please enter a reason for rejecting these items")
        }

        if (supplierOrderItemInstance?.hasErrors()) {
            supplierOrderItemInstance.errors.each {
                println(it)
            }
            render(view: '/admin/supplierOrderItem/reject-item', model: [supplierOrderItemInstance: supplierOrderItemInstance])
            return
        }

        supplierOrderItemInstance.numberOfRejectItems = params.int("numberOfRejectItems")
        supplierOrderItemInstance.numberOfApprovedItems = supplierOrderItemInstance.totalNumberOfItems - params.int("numberOfRejectItems")
        supplierOrderItemInstance.rejectionReason = params?.rejectionReason
        supplierOrderItemInstance.processed = true

        supplierOrderItemInstance.save(flush: true)

        redirect(controller: 'adminSupplierOrder', action: 'show', id: supplierOrderItemInstance?.supplyOrder?.id)
    }

    def delete() {
        SupplierOrderItem supplierOrderItemInstance = SupplierOrderItem.findById(params?.id)

        if (!supplierOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: ['Supplier Order Item', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(controller: 'adminDashboard', action: 'index')
            return
        }

        SupplierOrder supplierOrderInstance = supplierOrderItemInstance?.supplyOrder

        supplierOrderItemInstance.delete()

        redirect(controller: 'adminSupplierOrder', action: 'show', id: supplierOrderInstance?.id)
    }

    def productOptionsForProduct() {
        Product product = Product.findById(params?.id)

        if (!product) {
            flash.message = message(code: 'default.not.found.message', args: ['Product', params?.id])
            flash.messageType = "alert-error"
            flash.messageHeading = "Error"
            redirect(action: "list")
            return
        }

        render(template: '/admin/supplierOrderItem/form-add-product-option', model: [productOptions: product?.productOptions])
    }
}
