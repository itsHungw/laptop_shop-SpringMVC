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
                                <div class="container mt-5  ">
                                    <div class="container mt-2 mb-5">

                                        <div class="container mt-5  ">
                                            <div class="row">
                                                <div class="col-md-6 col-12 mx-auto ">
                                                    <h1>Update User</h1>
                                                    <form:form action="/admin/user/update" method="post"
                                                        modelAttribute="user">

                                                        <div class="mb-3" hidden>
                                                            <label for="id" class="form-label">ID</label>
                                                            <form:input type="text" readonly="true" class="form-control"
                                                                id="id" name="id" path="id" />
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="email" class="form-label">Email</label>
                                                            <form:input disabled="true" type="email"
                                                                class="form-control" id="email" name="email"
                                                                path="email" />
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="fullName" class="form-label">Full
                                                                Name</label>
                                                            <form:input type="text" class="form-control" id="fullName"
                                                                name="fullName" path="fullName" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="address" class="form-label">Address</label>
                                                            <form:input type="text" class="form-control" id="address"
                                                                name="address" path="address" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="phone" class="form-label">Phone</label>
                                                            <form:input type="text" class="form-control" id="phone"
                                                                name="phone" path="phone" />
                                                        </div>
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </form:form>
                                                </div>

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