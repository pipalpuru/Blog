package myblogapp

import grails.gorm.services.Service

@Service(Blog)
interface BlogService {

    Blog get(Serializable id)

    List<Blog> list(Map args)

    Long count()

    void delete(Serializable id)

    Blog save(Blog blog)

}