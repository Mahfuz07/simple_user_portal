<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bnp.css"/>
    <g:javascript library="jquery"></g:javascript>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <h3 class="w3-bar-item">Menu</h3>
    <a href="/" class="w3-bar-item w3-button">User List</a>
    %{--    <a href="/profile/change" class="w3-bar-item w3-button">Change Password</a>--}%
    %{--    <a href="#" class="w3-bar-item w3-button">Link 3</a>--}%
</div>

<div class="container-fluid text-center" style="margin-left:25%">

    <div class="page-header">
        <h1>User List</h1>
        <form class="form-signin" action="search" method="GET" id="loginForm" autocomplete="off">
            <input class="btn table-bordered" type="text" placeholder="search by first name" name="search" id="search"/>
            <button id="submit" class="btn btn-success" type="submit">Search</button>
        </form>
    </div>
    %{--    <div align="center" id="list-user" class="content scaffold-list" role="main">--}%
    %{--        <h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    %{--        <g:if test="${flash.message}">--}%
    %{--            <div class="message" role="status">${flash.message}</div>--}%
    %{--        </g:if>--}%
    %{--                <f:table collection="${userList}" />--}%

    <div align="center">
        <table >


            <thead>
            <tr>
                <td>Name</td>
                <td>Age</td>
                <td>Email</td>
                <td>Phone</td>
            </tr>

            </thead>
        <tbody>
            <g:each  in="${userList}" status="i" var="users">
                <tr>
                    <td>${users.firstName} ${users.lastName}</td>
                    <td><g:formatDate date="${users.birthday}" type="date" style="MEDIUM"/></td>
                    <td>${users.email}</td>
                    <td>${users.phone}</td>
                </tr>

                </tbody>
            </g:each>
        </table>
%{--        <div class="pagination">--}%
%{--            <g:paginate total="${userCount ?: 0}" />--}%
%{--        </div>--}%
    </div>
</div>





</div>




</div>
</body>
</html>



