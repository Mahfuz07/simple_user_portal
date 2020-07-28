<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Register</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <h3 class="w3-bar-item">Menu</h3>
    <a href="/" class="w3-bar-item w3-button">Profile Page</a>
    <a href="/profile/change" class="w3-bar-item w3-button">Change Password</a>
    %{--    <a href="#" class="w3-bar-item w3-button">Link 3</a>--}%
</div>
<div class="container-fluid text-center" style="margin-left:25%">
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">Change Password Here</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="changepassword" method="POST" id="loginForm" autocomplete="off">


%{--                    <div class="form-group">--}%
%{--                        <label for="currentpassword">Current Password</label>--}%
%{--                        <input type="password" placeholder="Current Password" class="form-control" name="currentpassword" id="currentpassword" autocapitalize="none"/>--}%
%{--                        <i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>--}%
%{--                    </div>--}%

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" placeholder="Your password" class="form-control" name="password" id="password"/>
                        <i id="passwordTogglerr" title="toggle password display" onclick="passwordDisplayTogglee()">&#128065;</i>
                    </div>

                    <div class="form-group">
                        <label for="password">Re-Enter Password</label>
                        <input type="password" placeholder="Re-enter password" class="form-control" name="repassword" id="repassword"/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Save</button>
                    <hr class="my-4">

                </form>
            </div>
        </div>
    </div>
</div>

</div>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['password'].focus();
    });
</script>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['email'].focus();
    });
    function passwordDisplayToggle() {
        var toggleEl = document.getElementById("passwordToggler");
        var eyeIcon = '\u{1F441}';
        var xIcon = '\u{2715}';
        var passEl = document.getElementById("currentpassword");
        if (passEl.type === "password") {
            toggleEl.innerHTML = xIcon;
            passEl.type = "text";
        } else {
            toggleEl.innerHTML = eyeIcon;
            passEl.type = "password";
        }

    }
</script>

</body>
</html>
