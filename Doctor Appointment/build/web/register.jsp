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
        <title>Register</title>

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
                <div class="col-md-10 offset-md-1">
                    <div class="card">
                        <div class="card-header text-black secondary text-center">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <h4>Student Registeration Form</h4>
                        </div>

                        <div class="card-body">
                            <form class="row g-3" id="login_form" action="RegisterServlet" method="POST">
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <input type="text" name="stud_name" class="form-control" id="name"
                                           placeholder="Enter name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="enrollment">Enrollment Id</label>
                                    <input type="text" name="stud_enrollment" class="form-control" id="enrollment"
                                           placeholder="Enter enrollment id" maxlength="7" required pattern="[a-zA-Z0-9]+">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="course">Course</label>
                                    <input type="text" name="stud_course" class="form-control" id="course"
                                           placeholder="Enter course name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="department">Department</label>
                                    <input type="text" name="stud_department" class="form-control" id="department"
                                           placeholder="Enter department name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="Age">Age</label>
                                    <input type="text" name="stud_age" class="form-control" id="Age"
                                           placeholder="Enter Age" required maxlength="2" pattern="[0-9]+">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="gender">Gender</label>
                                    <select class="form-select" id="gender" name="stud_gender" required>
                                        <option selected>--Select gender--</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="Phone">Phone</label>
                                    <input type="number" name="stud_phone" maxlength="10" class="form-control" id="phone"
                                           placeholder="Enter phone number" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email</label>
                                    <input type="email" name="stud_email" class="form-control" id="email"
                                           placeholder="Enter email id" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="password">Enter Password</label>
                                    <input type="password" name="stud_password" class="form-control" id="password"
                                           placeholder="Password" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="password">Confirm Password</label>
                                    <input type="password" name="stud_password2" class="form-control" id="password2"
                                           placeholder="Password" required>
                                </div>
                                <div class="d-grid d-flex justify-content-center">
                                    <button type="submit" id="btn" class="btn btn-lg secondary text-black">Register</button>
                                </div>
                                <div class="d-grid mt-2 d-flex justify-content-center">
                                    <p>Already Registered? <a href="login.jsp">Login</a></p>
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
