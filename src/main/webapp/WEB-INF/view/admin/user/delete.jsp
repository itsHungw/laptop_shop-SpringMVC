<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/resources/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <%@ include file="../layout/header.jsp" %>
                    <div id="layoutSidenav">
                        <%@ include file="../layout/sidebar.jsp" %>
                            <div id="layoutSidenav_content">
                                <div class="container">
                                    <div class="container mt-5 mb-5">

                                        <div class="d-flex justify-content-between mb-5">
                                            <h1>Delete User</h1>
                                        </div>

                                        <div class="card mx-auto" style="width: 60%;">
                                            <div class="card-header">
                                                User Detail ${user.id}
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">User Name: ${user.fullName}</li>
                                                <li class="list-group-item">Email: ${user.email}</li>
                                                <li class="list-group-item">Phone: ${user.phone}</li>
                                                <li class="list-group-item">Address: ${user.address}</li>
                                            </ul>
                                            <div class="card-footer">
                                                <form:form method="post" action="/admin/user/delete"
                                                    modelAttribute="deleteUser">
                                                    <div class="alert alert-danger" role="alert">
                                                        Are you sure you want to delete this user?
                                                    </div>
                                                    <form:hidden path="id" value="${user.id}" />
                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>




                                </div>
                                <%@ include file="../layout/footer.jsp" %>
                            </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/resources/js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                        crossorigin="anonymous"></script>
                    <script src="./resources/assets/demo/chart-area-demo.js"></script>
                    <script src="./resources/assets/demo/chart-bar-demo.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                        crossorigin="anonymous"></script>
                    <script src="./resources/js/datatables-simple-demo.js"></script>
            </body>