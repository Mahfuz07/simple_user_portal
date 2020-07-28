<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bnp.css"/>
    <g:javascript library="jquery"></g:javascript>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <h3 class="w3-bar-item">Menu</h3>
    <a href="/" class="w3-bar-item w3-button">Profile Page</a>
    <a href="/profile/change" class="w3-bar-item w3-button">Change Password</a>
%{--    <a href="#" class="w3-bar-item w3-button">Link 3</a>--}%
</div>

<div class="container-fluid text-center" style="margin-left:25%">

    <div class="page-header">
        <h1>Welcome Our Site </h1>
    </div>
  <div class="container">

      <table class="table-bordered">
          <tr class="table">
              <th>First Name </th>
              <th> ${user.firstName}</th>
          </tr>
          <tr>
              <th>Last Name </th>
              <th> ${user.lastName}</th>
          </tr>
          <tr>
              <th>Address </th>
              <th> ${user.address}</th>
          </tr>
           <tr>
                  <th>Phone </th>
                  <th> ${user.phone}</th>
            </tr>
          <tr>
              <th>Email </th>
              <th> ${user.email}</th>
          </tr>
          <tr>
              <th>Birthday </th>
              <th > <g:formatDate date="${user.birthday}" type="date" style="MEDIUM"/></th>
          </tr>
      </table>

  </div>


  </div>

</body>
</html>



