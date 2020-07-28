package com.mahfuz

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@Secured(['ROLE_USER'])
class ProfileController {

    UserService userService


    def springSecurityService
    def passwordEncoder

    static allowedMethods = [changepassword: "POST"]

    def userEmail = authenticatedUser

    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def index() {

       // if (authenticatedUser.authorities.contains(Role.findByAuthority(authority:'ROLE_ADMIN'))) {

        String auth  = SecurityContextHolder.getContext().getAuthentication().getAuthorities()


        if("[ROLE_ADMIN]" == auth.toString()){
        [user : userEmail]
            redirect controller:"admin",action:"index"
        }else {



            def age = User.findByEmail(userEmail.email)
            String a = age.getBirthday()
           String ages =  userService.AgeCheck(a)
            [userage : ages,user : userEmail]

        }
    }

    def change(){
    }

    def changepassword(){

        if(!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "change"
            return
        } else {
            try {
                //def user = User.findByEmail(params.email)?: new User(email: params.email, password: params.password, fullname: params.fullname).save()


                def userPass = User.findByEmail(userEmail.email)

                String pass = params.password

                //String cupass = userPass.password
                if(pass != null){

                    userPass.setPassword(pass)
                    userPass.save flush:true

                    flash.message = "Change successfully."

                    redirect action: "index"
                } else {
                    flash.message = "Password Change Failed"
                    render view: "change"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Password Change Failed"
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
