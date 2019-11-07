package myblogapp

import grails.plugin.springsecurity.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

@Secured('ROLE_ADMIN')
class BlogViewController {
    def index(){
        render(view: "/blog/homePage")
    }

    def displayBlogImage(){
        def record = Image.list()
        [record: record]
        def file = Image.findById(params.id)
        if (file) {
            byte[] imageArray = file.image
            response.setContentLength(imageArray.length)
            response.contentType = 'image/jpg'
            BufferedOutputStream outputStream = null
            try {
                ByteArrayInputStream inputStream = new ByteArrayInputStream(imageArray)
                outputStream = new BufferedOutputStream(response.getOutputStream())
                byte[] buffer = new byte[4096]
                int length = 0
                while ((length = inputStream.read(buffer)) >= 0) {
                    outputStream.write(buffer, 0, length)
                }

            } catch (Exception e) {
                println "Error!!!"
            } finally {
                if (outputStream != null) try {
                    outputStream.close()
                } catch (IOException logOrError) {
                }
            }
            response.outputStream << outputStream
            response.outputStream.flush()
        }
    }

    def loginPage() {
        render(view: "/blog/logInPage")
    }


    def adminPage() {
        render(view: "/blog/adminPage")
    }


    def signUpPage() {
        render(view: "/blog/sighUpPage")
    }




    /*def displayUserImage(){
        def record = Image.where {name == null}
        [record: record]
        def file = Image.findById(params.id)
        if (file) {
            byte[] imageArray = file.image
            response.setContentLength(imageArray.length)
            response.contentType = 'image/jpg'
            BufferedOutputStream outputStream = null
            try {
                ByteArrayInputStream inputStream = new ByteArrayInputStream(imageArray)
                outputStream = new BufferedOutputStream(response.getOutputStream())
                byte[] buffer = new byte[4096]
                int length = 0
                while ((length = inputStream.read(buffer)) >= 0) {
                    outputStream.write(buffer, 0, length)
                }
            } catch (Exception e) {
                println "Error!!!"
            } finally {
                if (outputStream != null) try {
                    outputStream.close()
                } catch (IOException logOrError) {
                }
            }
            response.outputStream << outputStream
            response.outputStream.flush()
        }
    }*/


    def newUser() {
        def img = request.getFile('userImage')
        println "params>>" + params
        println "img = $img"
        BufferedImage imm = ImageIO.read(img.getInputStream())
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream()
        //use another encoding if JPG is inappropriate for you
        ImageIO.write(imm, "jpg", outputStream)
        outputStream.flush()
        Byte[] encodedImage = outputStream.toByteArray()
        outputStream.close()
        println "encodedImage = $encodedImage"
        def data2 = new Image()
        data2.image=encodedImage
        if (!data2.validate()) {
            data2.errors.each { error ->
                println error
            }
        }
        data2.save(flush: true)

        def data = new User()
        data.firstName = params.firstName
        data.lastName = params.lastName
        data.username = params.username
        data.password = params.password1
        data.email=params.email
        data.image=data2
        if (!data.validate()) {
            data.errors.each { error ->
                println error
            }
        }
        data.save(flush: true)
        render(view: "/blogView/homePage")
    }

}


