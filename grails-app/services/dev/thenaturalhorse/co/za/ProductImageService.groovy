package dev.thenaturalhorse.co.za

import java.awt.image.BufferedImage
import com.quirklabs.hdimageutils.HdImageService

class ProductImageService {

    def hdImageService = new HdImageService()
    def grailsApplication

    def resizeProductImage(file, productName) {

        def validateImageResult = validateImage(file)

        if(validateImageResult == "valid") {

            byte[] imageBytes90 = hdImageService.scale(file.getInputStream(), 90, 90)
            byte[] imageBytes180 = hdImageService.scale(file.getInputStream(), 180, 180)
            byte[] imageBytes260 = hdImageService.scale(file.getInputStream(), 260, 260)

            InputStream is90 = new ByteArrayInputStream(imageBytes90)
            InputStream is180 = new ByteArrayInputStream(imageBytes180)
            InputStream is260 = new ByteArrayInputStream(imageBytes260)

            def uploadedFile90 = is90.s3upload("90.jpg") {
                path "products/" + productName
            }
            def uploadedFile180 = is180.s3upload("180.jpg") {
                path "products/" + productName
            }
            def uploadedFile260 = is260.s3upload("260.jpg") {
                path "products/" + productName
            }

            return "https://s3-eu-west-1.amazonaws.com/thenaturalhorse/products/" + productName
        } else {
            return validateImageResult
        }
    }

    def validateImage(file) {

        if(!file) {
            return "NF"
        }

        //Convert MultiPart file BufferedImage to get image dimensions.
        BufferedImage bufferedImage = hdImageService.getBufferedImage( file.getInputStream() )

        if((bufferedImage?.width >= grailsApplication?.config?.product?.image?.min?.width) && (bufferedImage?.height >= grailsApplication?.config?.product?.image?.min?.height)) {
            if(bufferedImage?.width == bufferedImage?.height) {
                return "valid"
            } else {
                return "ratioError"
            }
        } else {
            return "widthHeightError"
        }
    }
}
