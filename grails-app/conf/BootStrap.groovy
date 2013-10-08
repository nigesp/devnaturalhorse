import dev.thenaturalhorse.co.za.Role
import dev.thenaturalhorse.co.za.User
import dev.thenaturalhorse.co.za.UserRole

class BootStrap {

    def init = { servletContext ->

        /*Role adminRole = new Role()
        adminRole.authority = 'ROLE_ADMIN'
        adminRole.save(flush: true)

        Role userRole = new Role()
        userRole.authority = 'ROLE_USER'
        userRole.save(flush: true)

        def testUser = new User(username: 'nige', enabled: true, password: 'password')
        testUser.save(flush: true)

        UserRole.create(testUser, adminRole, true)

        assert Role.count() == 2
        assert User.count() == 1
        assert UserRole.count() == 1*/

    }
    def destroy = {
    }
}
