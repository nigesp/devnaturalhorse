package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminSupplierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        List<Supplier> suppliers = Supplier.findAllActive.list()

        render(view: '/admin/supplier/list', model: [supplierInstanceList: suppliers])

        /*params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: '/admin/supplier/list', model: [supplierInstanceList: Supplier.list(params), supplierInstanceTotal: Supplier.count()])*/
    }

    def create() {
        render(view: '/admin/supplier/create', model: [supplierInstance: new Supplier(params)])
    }

    def save() {
        def supplierInstance = new Supplier(params)
        supplierInstance?.status = params?.status
        if (!supplierInstance.save(flush: true)) {
            supplierInstance?.errors?.each {
                println it
            }
            render(view: "/admin/supplier/create", model: [supplierInstance: supplierInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def show() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        def orderedSupplierOrders = supplierInstance?.supplierOrders?.sort{ a, b ->
            b.id <=> a.id
        }

        render(view: '/admin/supplier/show', model: [supplierInstance: supplierInstance, orderedSupplierOrders: orderedSupplierOrders])
    }

    def edit() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        render(view: '/admin/supplier/edit', model: [supplierInstance: supplierInstance])
    }

    def update() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (supplierInstance.version > version) {
                supplierInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'supplier.label', default: 'Supplier')] as Object[],
                        "Another user has updated this Supplier while you were editing")
                render(view: "edit", model: [supplierInstance: supplierInstance])
                return
            }
        }

        supplierInstance.properties = params

        if (!supplierInstance.save(flush: true)) {
            render(view: "edit", model: [supplierInstance: supplierInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def delete() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        try {
            supplierInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
