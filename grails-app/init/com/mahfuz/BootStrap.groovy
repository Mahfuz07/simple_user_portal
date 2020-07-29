package com.mahfuz

class BootStrap {

    def init = { servletContext ->

        def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def USERRole = Role.findOrSaveWhere(authority: 'ROLE_USER')


//       def admin = User.findOrSaveWhere(email: 'admin@localhost.local', password: 'admin', firstName: 'admin', lastName: 'Joshi', address: 'Dhaka',phone: '01555555555',birthday: new Date())
//
//        if (!admin.authorities.contains(adminRole)) {
//            UserRole.create(admin, adminRole, true)
//        }
    }
    def destroy = {
    }
}
