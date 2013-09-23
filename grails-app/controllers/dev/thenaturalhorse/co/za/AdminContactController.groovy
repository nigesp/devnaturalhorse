package dev.thenaturalhorse.co.za

import org.springframework.dao.DataIntegrityViolationException

class AdminContactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def create() {
        Supplier supplierInstance = Supplier.findById(params?.supplierId)
        render(view: "/admin/contact/create", model: [contactInstance: new Contact(params), supplierInstance: supplierInstance])
    }

    def save() {
        Supplier supplierInstance = Supplier.findById(params?.supplierId)
        def contactInstance = new Contact(params)

        if (!supplierInstance) {
            redirect(controller: "adminSupplier", action: "list")
            //render(view: "create", model: [contactInstance: contactInstance, errorMessage: "No supplierId set."])
            return
        }

        if (!contactInstance.save(flush: true)) {
            contactInstance.errors.each {
                println(it)
            }
            render(view: "/admin/contact/create", model: [contactInstance: contactInstance, supplierInstance: supplierInstance])
            return
        }

        supplierInstance.addToContacts(contactInstance)

        supplierInstance.save()

        flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
        redirect(controller: "adminSupplier", action: "show", id: supplierInstance.id)
    }

    def edit() {
        def contactInstance = Contact.get(params.id)
        def supplierInstance = Supplier.get(params.supplierId)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/contact/edit", model: [contactInstance: contactInstance, supplierInstance: supplierInstance])
    }

    def update() {
        def contactInstance = Contact.get(params.id)
        def supplierInstance = Supplier.get(params.supplierId)

        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
            redirect(controller: "adminSupplier", action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contactInstance.version > version) {
                contactInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'contact.label', default: 'Contact')] as Object[],
                        "Another user has updated this Contact while you were editing")
                render(view: "edit", model: [contactInstance: contactInstance])
                return
            }
        }

        contactInstance.properties = params

        if (!contactInstance.save(flush: true)) {
            render(view: "edit", model: [contactInstance: contactInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
        redirect(controller: "adminSupplier", action: "show", id: supplierInstance.id)
    }

    def delete() {
        def contactInstance = Contact.get(params.id)
        def supplierInstance = Supplier.get(params.supplierId)

        if (!contactInstance) {
            println("dfsdfsdfsd")
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
            redirect(controller: "adminSupplier", action: "list")
            return
        }

        try {
            supplierInstance.removeFromContacts(contactInstance)
            supplierInstance.save(flush: true)
            contactInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
            redirect(controller: "adminSupplier", action: "show", id: supplierInstance.id)
        }
        catch (DataIntegrityViolationException e) {
            println(e)
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
