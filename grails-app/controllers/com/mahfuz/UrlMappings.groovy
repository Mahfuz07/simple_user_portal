package com.mahfuz

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"profile",action:"index")
        "/admin"(controller:"admin",action:"index")
        "/search"(controller:"admin",action:"query")
        "/login"(controller: 'login', action: 'auth')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
