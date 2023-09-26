<%@page import="com.user.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Login</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <!--icon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body {
                font-family: 'Trebuchet MS', sans-serif;
                background-color: #036c5f;
            }

            .primary {
                background-color: #036c5f;
            }

            .secondary {
                background-color: #eea676;
            }

            #btn:hover {
                background-color: #036c5f;
                color: white;
                transition: ease-in-out;
            }
        </style>
    </head>

    <body>
        <!--navbar-->
        <%@include file="navbar.jsp"%>

        <!--login page-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-black secondary text-center">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <h4>Login</h4>
                        </div>
                        <%
                            Message msg = (Message) session.getAttribute("msg");
                            if (msg != null) {
                        %>
                        <div class="alert <%= msg.getCssClass()%>" role="alert">
                            <%= msg.getContent()%>
                        </div>
                        <%
                                session.removeAttribute("msg");
                            }
                        %>
                        <div class="card-body">
                            <form id="login_form" action="LoginServlet" method="POST">
                                <div class="form-group">
                                    <label for="enrollment">Enrollment id</label>
                                    <input type="text" name="student_enrollment" class="form-control" id="enrollment"
                                           aria-describedby="emailHelp" maxlength="7" placeholder="Enter enrollment id" required pattern="[a-zA-Z0-9]+">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="student_password" class="form-control" id="password"
                                           placeholder="Enter password" required>
                                </div>
                                <div class="d-grid mt-3 d-flex justify-content-center">
                                    <button type="submit" id="btn" class="btn btn-lg secondary text-black">Login</button>
                                </div>
                                <div class="d-grid mt-2 d-flex justify-content-center">
                                    <p>New user? <a href="register.jsp">Register</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
    </body>

</html>
