package myblogapp

class BootStrap {

    def init = { servletContext ->
        if(User.count == 0){
            def adminRole = new Role(authority: 'ROLE_ADMIN').save()

            def testUser = new User(username: 'admin', password: 'admin123').save()

            UserRole.create testUser, adminRole

            UserRole.withSession {
                it.flush()
                it.clear()
            }

            assert User.count() == 1
            assert Role.count() == 1
            assert UserRole.count() == 1
        }
    }
    def destroy = {
    }
}
