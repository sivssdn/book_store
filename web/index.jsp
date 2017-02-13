<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//TODO:// error pages

%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="msapplication-tap-highlight" content="no">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta name="theme-color" content="#D32F2F">

    <title>Book Store</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">

    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css" media="screen,projection"/>

    <style>
        .nav-wrapper {
            background-color: #D32F2F;
        }

        .modal {
            min-height: 100% !important;
            max-height: 100% !important;
        }

        #confirm {
            min-height: 25% !important;
            max-height: 25% !important;
        }

        #toast-container {
            top: auto !important;
            right: 2%;
            bottom: 10%;
            left: auto !important;
        }

        #add_record_table {
            width: 40%;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="navbar-fixed">
    <header>
        <nav>
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo"> &nbsp;BOOK STORE</a>
                <a href="#" data-activates="mobile-menu" class="button-collapse"><img src="./images/menu.svg"
                                                                                      style="vertical-align:middle;"></a>
                <ul class="right hide-on-med-and-down">
                    <%--<li><a href="internetstocks.html"> INTERNET STOCKS</a></li>--%>
                    <li><a class="modal-trigger" href="#modal1"> ADD NEW</a></li>
                </ul>
                <ul class="side-nav" id="mobile-menu">
                    <%--<li><a href="internetstocks.html"> INTERNET STOCKS</a></li>--%>
                    <li><a class="modal-trigger" href="#modal1">ADD NEW</a></li>
                </ul>
            </div>
        </nav>
    </header>
</div>
<div class="section"></div>
<div class="section"></div>
<main>
    <div class="container">
        <div class="row">

            <input type="text" style="background-color:white;text-align:center;" placeholder="SEARCH LIST" id="search"
                   autofocus>

            <ul class="collection" id="main_list">
                <li class="collection-item avatar" id="c1">
                    <img class="circle" src="images/correct.svg">
                    <span class="title">Maintainance</span>
                    <p>First Line</p> <br>
                    Second Line
                    </p>
                    <a href="tel:" class="secondary-content"><img src="call1.svg"></a>

                </li>


            </ul>
        </div>

    </div>
</main>
</body>
</html>
