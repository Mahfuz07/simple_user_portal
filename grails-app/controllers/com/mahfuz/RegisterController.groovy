package com.mahfuz

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import java.text.SimpleDateFormat

@Transactional
@Secured('permitAll')
class RegisterController {

    def springSecurityService
    UserService userService

    static allowedMethods = [register: "POST", emailcheck: "POST"]


    def emailcheck() throws Exception{

        String paramEmail = params.emaill

        String availability
        try{
            def email=  userService.findByEmailIgnoreCase(paramEmail)
            String name =  email.email.toString()
            if(name == paramEmail){
               availability = true
            }
        }catch(Exception e){
            availability = false
            System.out.println(e)
        }

        response.setContentType("text/json;charset=UTF-8");
        render availability
    }




    def index() {
        respond new User(params)
    }

    def register(User user) {
        if (!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } else {
            try {
                //   def user = User.findByEmail(params.email)?: new User(email: params.email, password: params.password, firstName: params.firstName, lastName: params.lastName, address: params.address, phone: params.phone, birthday: params.birthday).save()

                if (user == null) {
                    transactionStatus.setRollbackOnly()
                    notFound()
                    return
                }

                if (user.hasErrors()) {
                    //transactionStatus.setRollbackOnly()
                    flash.message = "Email Already Exist!"
                    respond user.errors, view:'index'
                    return
                }

                //user.setPassword(springSecurityService.encodePassword(params.password))
                user.save flush: true

                def role = Role.findWhere(authority: 'ROLE_USER')
                if (!user.authorities.contains(role)) {
                    UserRole.create(user, role, true)
                    // def role = Role.findWhere(authority: 'ROLE_USER')
//                def role = Role.get(params.role.id)
//                if(user && role) {
//                    UserRole.create(user, role, true)
//
//                    UserRole.withSession {
//                        it.flush()
//                        it.clear()
//                   }


                    flash.message1 = "You have registered successfully. Please login."
                    redirect controller: "login", action: "auth"

                } else {
                    flash.message = "Register failed"
                    render view: "index"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Register Failed"
                redirect action: "index"
                return
            }
        }


        }



    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('currentpassword')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
    }
