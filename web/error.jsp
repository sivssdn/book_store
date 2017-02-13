<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="msapplication-tap-highlight" content="no">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta name="theme-color" content="#D32F2F">

    <title>Error</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
    <!--Importmaterialize.css-->
    <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css" media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<style>

    .nav-wrapper {
        background-color: #c4122f;
    }

    @media only screen and (max-width: 990px) {
        html, body {
            background-color: #eeeeee;
        }
    }
/*

    @media only screen and (min-width: 992px) {
        html, body {
            background-image: url("./images/White.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
        }

    }
*/

</style>

<body>

<div class="container" style="width: 25em;">
    <div class="section"></div>
    <div class="section"></div>
    <div class="section"></div>
    <div class="section"></div>
    <div class="row">
        <h3 class="center">
            <%
                if (request.getParameter("error") != null) {
                    out.print(request.getParameter("error"));

                }
            %>
        </h3>
    </div>
    <div class="row center">
        <a id="back" class="btn btn-large waves-effect red waves-red">Go To Home</a>
    </div>
</div>
</body>
<script>
    document.getElementById("back").addEventListener("click",function () {
        window.location.replace('index.jsp');
    });
</script>
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>

</html>