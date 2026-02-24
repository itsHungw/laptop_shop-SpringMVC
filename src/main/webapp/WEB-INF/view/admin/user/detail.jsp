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

                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <div class="row align-items-center">

                                                    <!-- Avatar -->
                                                    <div class="col-md-4 text-center mb-3">
                                                        <c:choose>
                                                            <c:when test="${user.avatar != null}">
                                                                <img src="/images/avatar/${user.avatar}"
                                                                    class="rounded-circle border"
                                                                    style="width:250px;height:250px;object-fit:cover;">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="/images/default-avatar.png"
                                                                    class="rounded-circle border"
                                                                    style="width:250px;height:250px;object-fit:cover;">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <!-- User Info -->
                                                    <div class="col-md-8">
                                                        <h4 class="mb-3">${user.fullName}</h4>

                                                        <p><strong>Email:</strong> ${user.email}</p>
                                                        <p><strong>Phone:</strong> ${user.phone}</p>
                                                        <p><strong>Address:</strong> ${user.address}</p>

                                                        <p>
                                                            <strong>Role:</strong>
                                                            <span class="badge 
                        ${user.role.name == 'ADMIN' ? 'bg-danger' : 
                          user.role.name == 'STAFF' ? 'bg-warning text-dark' : 
                          'bg-secondary'}">
                                                                ${user.role.name}
                                                            </span>
                                                        </p>

                                                        <div class="mt-3">
                                                            <a href="/admin/user" class="btn btn-secondary btn-sm">
                                                                Back
                                                            </a>
                                                            <a href="/admin/user/update/${user.id}"
                                                                class="btn btn-primary btn-sm">
                                                                Update
                                                            </a>
                                                            <a href="/admin/user/delete/${user.id}"
                                                                class="btn btn-danger btn-sm">
                                                                Delete
                                                            </a>
                                                        </div>
                                                    </div>

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