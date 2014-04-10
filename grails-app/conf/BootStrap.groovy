import dev.thenaturalhorse.co.za.Role
import dev.thenaturalhorse.co.za.User
import dev.thenaturalhorse.co.za.UserRole
import dev.thenaturalhorse.co.za.ProductCategory
import dev.thenaturalhorse.co.za.Supplier
import dev.thenaturalhorse.co.za.enums.DomainModelState
import dev.thenaturalhorse.co.za.Product
import dev.thenaturalhorse.co.za.enums.ProductState
import dev.thenaturalhorse.co.za.ProductOption

class BootStrap {

    def init = { servletContext ->

        List<ProductCategory> productCategories = ProductCategory.findAll()
        if(productCategories.size() < 1) {
            ProductCategory category = new ProductCategory()
            category.name = "Supplements"
            category.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

            category.save(flush: true)
        }

        List<Supplier> suppliers = Supplier.findAll()
        if(suppliers.size() < 1) {
            Supplier supplier = new Supplier()
            supplier.name = "Honeyvale Herbs"
            supplier.supplierCode = "HH"
            supplier.daysFromOrderToDelivery = 4
            supplier.status = DomainModelState.ACTIVE


            Product product = new Product()
            product.supplier = supplier
            product.name = "Deap Sea Kelp"
            product.description = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
            product.manufacturer = "Honeyvale Herbs"
            product.imageUrl = "https://s3-eu-west-1.amazonaws.com/thenaturalhorse/products/honeyvaleherbs"
            product.ingredients = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
            product.category = ProductCategory.findAll().get(0)
            product.state = ProductState.AVAILABLE

            ProductOption productOption = new ProductOption()
            productOption.product = product
            productOption.numProducts = 2
            productOption.price = 342.50

            product.addToProductOptions(productOption)
            supplier.addToProducts(product)

            if(!supplier.save(flush: true)) {
                supplier.errors.each {
                    println it
                }
            }
        }



    }
    def destroy = {
    }
}
