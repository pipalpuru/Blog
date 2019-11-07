package myblogapp

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class BlogController {

    BlogService blogService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond blogService.list(params), model:[blogCount: blogService.count()]
    }

    def show(Long id) {
        respond blogService.get(id)
    }

    def create() {
        respond new Blog(params)
    }

    def save(Blog blog) {
        if (blog == null) {
            notFound()
            return
        }

        try {
            blogService.save(blog)
        } catch (ValidationException e) {
            respond blog.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'blog.label', default: 'Blog'), blog.id])
                redirect blog
            }
            '*' { respond blog, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond blogService.get(id)
    }

    def update(Blog blog) {
        if (blog == null) {
            notFound()
            return
        }

        try {
            blogService.save(blog)
        } catch (ValidationException e) {
            respond blog.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'blog.label', default: 'Blog'), blog.id])
                redirect blog
            }
            '*'{ respond blog, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        blogService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
