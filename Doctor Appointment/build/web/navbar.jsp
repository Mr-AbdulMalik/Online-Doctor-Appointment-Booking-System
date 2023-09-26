<%@page import="com.user.entities.Student"%>

<%
    Student user = (Student) session.getAttribute("currentUser");
    String name = "";
    if (user != null) {
        name = user.getName();
    }
%>

<!-- navbar start -->

<nav class="navbar navbar-expand-lg navbar-dark primary" style="z-index: 3; font-family: 'DM Sans', 'sans-serif'; position: -webkit-sticky; position: sticky; top: 0;">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"
           style="font-size: 26px; font-weight: 700; font-family: 'Brush Script MT', cursive;">
            IBN-E-SINA</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        </div>
    </div>
</nav>

<!-- navbar end -->