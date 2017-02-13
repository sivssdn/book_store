<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //TODO:// error pages
    //TODO:// to enable users to add books without donating to store, go to LoginManager and uncomment Strind department=Other
    String department = (String) session.getAttribute("department");
    int dep = 0;
    if (department != null) {
        if (department.intern() == "other")
            dep = 1;
        else if (department.intern() == "admin")
            dep = 2;
    }
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
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--gmail login headers-->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="447413120920-vc7i2j5a8lefvotflqlbfb7sm43cqtmf.apps.googleusercontent.com">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>

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

        .circle {
            font-size: 2.5em !important;
        }

        .fontSize {
            font-size: 3em;
            color: #D32F2F;
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
                    <%
                        if (dep != 0) {
                    %>
                    <li><a class="modal-trigger" href="#modal1"> ADD NEW</a></li>
                    <%
                        }
                        //display login only if the user is not signed in
                        if (dep == 0) {
                    %>
                    <li>
                        <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"
                             style="margin-top: 10%;"></div>
                    </li>
                    <%}%>
                </ul>
                <ul class="side-nav" id="mobile-menu">
                    <%
                        if (dep != 0) {
                    %>
                    <li><a class="modal-trigger" href="#modal1">ADD NEW</a></li>
                    <%
                    }
                    //display login only if the user is not signed in
                    else if (dep == 0) {
                    %>
                    <li>
                        <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"
                             style="margin-top: 10%;"></div>
                    </li>
                    <%}%>
                </ul>
            </div>
        </nav>
    </header>
</div>

<div class="section"></div>
<div class="section"></div>
<main>

    <!-- Modal Structure -->
    <div id="modal1" class="modal bottom-sheet modal-fixed-footer">
        <div class="modal-content">
            <img src="images/close.svg" class="right modal-action modal-close waves-effect waves-red btn-flat"
                 id="close">
            <h4>Add new record</h4>

            <p>

            <div id="progress1" class="progress materialize-red hide">
                <div class="indeterminate white"></div>
            </div>
            <table id="add_record_table" class="responsive-table center">
                <tbody>
                <tr>
                    <th>Name :</th>
                    <th>
                        <div class="input-field">
                            <div class="input-field ">
                                <input id="name" name="name" type="text" class="validate">
                                <label for="name">Name of book</label>
                            </div>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th>Author :</th>
                    <th>
                        <div class="input-field ">
                            <input id="author" name="author" type="text" class="validate">
                            <label for="author">Author</label>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th>Quantity :</th>
                    <th>
                        <div class="input-field ">
                            <input id="quantity" name="quantity" type="number" class="validate" min="0">
                            <label for="quantity">Enter Quantity</label>
                        </div>
                    </th>
                </tr>
                <%--             <tr>
                                 <th>Contribute to :</th>
                                 <th>
                                     <div class="input-field">
                                         <select id="contributeTo">
                                             <option value="Book Store" selected>Book Store</option>
                                             <option value="People">Other readers</option>
                                         </select>
                                         <label>Choose</label>
                                     </div>
                                 </th>
                             </tr>

                --%>             </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <a href="#confirm" id="add_submit"
               class=" waves-effect waves-green btn materialize-red">ADD</a>
            <a href="#!"
               class="modal-action modal-close waves-effect waves-red btn-flat">CLOSE</a>
        </div>

    </div>
    <!--Modal over-->
    <!--confirmation modal-->
    <div class="modal" id="confirm">
        <div class="modal-content">
            <h5>Are you sure?</h5>
        </div>
        <div class="modal-footer">
            <a href="#!" id="submit" class=" modal-action modal-close waves-effect waves-green btn-flat">YES</a>
            <a href="#!" id="confirm_no" class=" modal-action modal-close waves-effect waves-green btn-flat">NO</a>
        </div>
    </div>
    <!--confirm modal over-->


    <div class="container">
        <div class="row">

            <nav>
                <div class="nav-wrapper">
                    <form>
                        <div class="input-field">
                            <input id="search" type="search" autofocus>
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                            <i class="material-icons">close</i>
                        </div>
                    </form>
                </div>
            </nav>

            <div class="section"></div>
            <div class="section"></div>

            <ul class="collection" id="main_list">
                <li class="collection-item avatar valign-wrapper" id="c1">


                    <p>
                        <strong>Type in the search bar book/author name you want to search</strong><br><br>
                        Portal developed by <a href="https://www.facebook.com/sivssdn" target="_blank">Paras
                        Bhattrai</a>
                    </p>


                </li>

            </ul>
        </div>

    </div>
</main>
</body>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>

    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
        $(".button-collapse").sideNav();
        $('select').material_select();

    });


    document.getElementById("add_submit").addEventListener("click", function () {
        $('#modal1').closeModal('close');
        $('#confirm').openModal('open');
    });
    document.getElementById("confirm_no").addEventListener("click", function () {
        $('#modal1').openModal('open');
    });


    document.getElementById("search").onkeyup = function () {
        startRecord = 0;
        searchRecords();
    };
    var startRecord = 0;
    function searchRecords() {
        try {
            xhr1 = new XMLHttpRequest();
        } catch (e) {
            xhr1 = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xhr1 == null)
            alert("Unable to run program. Connection Issue (Ajax request)");
        var search_term = document.getElementById("search").value;

        var url1 = "searchBooks?search_term=" + search_term + "&start_record=" + startRecord;
        xhr1.onreadystatechange = function () {
            if (xhr1.readyState == 4 && xhr1.status == 200) {
                var response = JSON.parse(xhr1.responseText); //all records
                var lengthOfrecords = response.length;

                var list = document.getElementById('main_list');
                //clear previous table
                while (list.hasChildNodes())
                    list.removeChild(list.firstChild);

                //fill new table
                var li, iTagBook, iTagEmail, p, a;
                for (var i = 0; i < lengthOfrecords; i++) {
                    li = document.createElement('li');
                    iTagBook = document.createElement('i');
                    iTagEmail = document.createElement('i');
                    p = document.createElement('p');
                    a = document.createElement('a');

                    li.className = "collection-item avatar valign-wrapper";
                    iTagBook.className = "circle valign material-icons white " + response[i].color;
                    iTagBook.appendChild(document.createTextNode('library_books'));
                    p.appendChild(document.createTextNode(response[i].name + ' \u00a0 \u00a0 by ' + response[i].author));
                    a.href = 'mailto:' + response[i].email;
                    a.className = "secondary-content";
                    iTagEmail.className = "fontSize material-icons";
                    iTagEmail.appendChild(document.createTextNode('email'));

                    a.appendChild(iTagEmail);

                    li.appendChild(iTagBook);
                    li.appendChild(p);
                    li.appendChild(a);

                    list.appendChild(li);
                }

                if (lengthOfrecords == 0) {
                    li = document.createElement('li');
                    p = document.createElement('p');
                    iTagBook = document.createElement('i');

                    iTagBook.className = "circle valign material-icons white red-text";
                    iTagBook.appendChild(document.createTextNode('library_books'));
                    li.className = "collection-item avatar valign-wrapper";
                    p.appendChild(document.createTextNode('Sorry couldn\'t find that one '));
                    li.appendChild(iTagBook);
                    li.appendChild(p);

                    list.appendChild(li);
                }


            /*
             //load more data
             if (lengthOfrecords > 30) {
             li = document.createElement('li');
             p = document.createElement('p');
             a = document.createElement('a');

             li.className = "collection-item avatar valign-wrapper";

             a.id = "loadMore";
             a.addEventListener("click", function () {
             startRecord += 30;
             searchRecords();
             });

             a.appendChild(document.createTextNode('LOAD MORE'));
             p.appendChild(a);
             li.appendChild(p);

             list.appendChild(li);
             }*/
        }
    };

    xhr1.open("POST", url1, true);
    xhr1.send(null);
    }


    <%
        if(dep != 0){ //others
    %>

    document.getElementById("submit").addEventListener("click", function () {
        $('#modal1').openModal('open');
        document.getElementById("add_submit").innerHTML = "Please wait";
        $('#progress1').removeClass('hide');
        addNewRecord();
    });

    //to submit form, ajax
    function addNewRecord() {
        try {
            xhr = new XMLHttpRequest();
        } catch (e) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xhr == null)
            alert("Unable to run program. Connection Issue (Ajax request)");
        var name = document.getElementById("name").value;
        var author = document.getElementById("author").value;
        var quantity = document.getElementById("quantity").value;
        //var contributeTo = document.getElementById("contributeTo").value;

        var url = "addNewBook?name=" + name + "&quantity=" + quantity + "&author=" + author;

        //var url = "addNewBook?name=" + name + "&quantity=" + quantity + "&author=" + author + "&contributeTo=" + contributeTo;
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = xhr.responseText;
                //if the record is added, then make ui changes
                if (response == "success") {
                    Materialize.toast('Record entered successfully', 6000);
                    document.getElementById("add_submit").innerHTML = "ADD";
                    $('#progress1').addClass('hide');

                }
            }
        };

        xhr.open("POST", url, true);
        xhr.send(null);
    }
    <%}%>


</script>
<%
    //display login only if the user is not signed in
    if (dep == 0) {
%>
<script>

    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        /*console.log("ID: " + profile.getId()); // Don't send this directly to your server!
         console.log('Full Name: ' + profile.getName());
         console.log('Given Name: ' + profile.getGivenName());
         console.log('Family Name: ' + profile.getFamilyName());
         console.log("Image URL: " + profile.getImageUrl());
         console.log("Email: " + profile.getEmail());
         */
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
//    console.log("ID Token: " + id_token);
        var url = "checkAuth.jsp";

        $.ajax({
            type: 'POST',
            url: url,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: {id: googleUser.getAuthResponse().id_token},
            success: function (response) {
                $('#info-modal .modal-title #spinner').remove();

                if (response && response.status == 0) {
                    //location.pathname = location.pathname.replace(/(.*)\/[^/]*/, "$1/"+ 'dashboard');
                    //alert ("logged in as " + response.email + " name = " + response.name);
                    location.replace("index.jsp");
                }
                else {
                    console.log(response.error);
                    //LOG("Showing error");
                    //alert('Error: ' + response.error);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('There was an unexpected error in connecting to the server');
            },
        });
    }
    /*

     //customize sign in button
     function renderButton() {
     gapi.signin2.render('my-signin2', {
     'scope': 'profile email',
     'width': 240,
     'height': 50,
     'longtitle': true,
     'theme': 'dark',
     'onsuccess': onSuccess,
     'onfailure': onFailure
     });
     }
     */

</script>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<%}%>

</html>