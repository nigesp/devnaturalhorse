package dev.thenaturalhorse.co.za

class AdminProductController {

    def index() { }

    def list() {
        render(view: '/admin/product/list')
    }
}
