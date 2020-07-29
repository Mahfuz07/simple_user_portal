package com.mahfuz

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder


@Secured(['ROLE_ADMIN'])
class AdminController {

    //static allowedMethods = [changepassword: "POST"]


    def userEmail = authenticatedUser

    def index(Integer max) {
        //[user : userEmail]

        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userCount: User.count()]
    }

    //@Secured(['ROLE_ADMIN'])
    def search(){


        redirect ([action: "query"],params.search)
    }

    def query(){
        def queryResult = User.findAllByFirstNameLike("%"+params.search+"%")

        render (view:"search",model: [userList: queryResult])
    }
}
