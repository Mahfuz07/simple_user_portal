<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <asset:stylesheet src="application.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title>Register</title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <div class="table"><h5 class="card-title text-center">Register Here</h5></div>


                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>

%{--                <g:hasErrors bean="${this.user}">--}%
%{--                    <ul class="errors" role="alert">--}%
%{--                        <g:eachError bean="${this.user}" var="error">--}%
%{--                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
%{--                        </g:eachError>--}%
%{--                    </ul>--}%
%{--                </g:hasErrors>--}%

                <form class="form-signin" resource="${this.user}" action="register" method="POST" id="loginForm" autocomplete="off">
%{--                    <div class="form-group">--}%
%{--                        <label for="role">Role</label>--}%
%{--                        <g:select class="form-control" name="role.id"--}%
%{--                                  from="${com.mahfuz.Role.list()}"--}%
%{--                                  optionKey="id" />--}%
%{--                    </div>--}%

                    <div class="form-group">
                        <label for="firstName">First Name</label>

                        <input type="text" placeholder="Your First Name" required="required" class="form-control" name="firstName" id="firstName" autocapitalize="none" property="firstName" bean="user"/>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" placeholder="Your Last Name" required="required" class="form-control" name="lastName" id="lastName" autocapitalize="none" property="lastName" bean="user"/>
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" placeholder="Your Address" required="required" class="form-control" name="address" id="address" autocapitalize="none" property="address" bean="user"/>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="number" placeholder="Your Phone No" required="required" class="form-control" name="phone" id="phone" autocapitalize="none" property="phone" bean="user"/>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" placeholder="Your Email" required="required" class="form-control" name="email" id="email" autocapitalize="none" property="email" bean="user"/>

                        <span id="availability" ></span>

                    </div>

%{--                    <div class="form-group">--}%
%{--                        <label for="birthday">Birthday</label>--}%
%{--                        <input type="date"  placeholder="Your username" required="required" class="form-control" name="birthday" id="birthday" autocapitalize="none" property="birthday" bean="user"/>--}%
%{--                    </div>--}%

                <div class="form-group">
                    <f:field property="birthday" bean="user" class="form-control"></f:field>
                </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" placeholder="Your password" required="required" class="form-control" name="password" id="password" property="password" bean="user"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Re-Enter Password</label>
                        <input type="password" placeholder="Re-enter password" required="required" class="form-control" name="repassword" id="repassword"/>
                    </div>


                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
                    <hr class="my-4">
                    <p>Already have an account? <g:link controller="login" action="auth">Login</g:link></p>
                </form>


%{--                <g:form resource="${this.user}" action="register" method="POST">--}%
%{--                    <fieldset class="table-bordered">--}%
%{--                        <div class="form-group">--}%
%{--                            <f:field property="firstName" bean="user" class="form-control"></f:field>--}%
%{--                            <f:field property="lastName" bean="user" class="form-control"></f:field>--}%
%{--                            <f:field property="address" bean="user" class="form-control"></f:field>--}%
%{--                            <f:field property="phone" bean="user" class="form-control"></f:field>--}%
%{--                            <f:field property="email" bean="user" class="form-control"></f:field>--}%
%{--                            <f:field property="birthday" bean="user" class="form-control"></f:field>--}%
%{--                            <f:field property="password" bean="user"></f:field>--}%
%{--                            <f:field property="password" bean="user"></f:field>--}%
%{--                        </div>--}%

%{--                        <div class="button" >--}%
%{--                            <g:submitButton name="register"   />--}%
%{--                        </div>--}%

%{--                    </fieldset>--}%
%{--                --}%%{--                <fieldset class="buttons">--}%
%{--                --}%%{--                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
%{--                --}%%{--                </fieldset>--}%
%{--                </g:form>--}%


            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function (){
        $("#email").blur(function () {

            var email = $('#email').val();
            $.ajax({

                url: "/register/emailcheck",
                method: "POST",
                data: {emaill : email},
                datatype: "text",
                success:function (data) {
                   // $('#availability').html(data);
                   if(data === true){
                       $('#availability').html("<label class='text-danger'>Email Already Exist<label>");
                   }else{
                       $('#availability').html("<label class='text-success'>Email available!<label>");
                   }
                }
            })
        });

    });


</script>


<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['email'].focus();
    });
</script>
</body>
</html>
