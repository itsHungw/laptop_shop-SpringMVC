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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <%@ include file="../layout/header.jsp" %>
                    <div id="layoutSidenav">
                        <%@ include file="../layout/sidebar.jsp" %>
                            <div id="layoutSidenav_content">
                                <div class="container mt-5  ">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto ">
                                            <h1 class="text-center mb-5">Create User</h1>
                                            <form:form action="/admin/user/create" method="post"
                                                modelAttribute="newUser" enctype="multipart/form-data">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="email" />
                                                        </c:set>
                                                        <label for="email" class="form-label">Email:</label>
                                                        <form:input type="email"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            path="email" />
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="password" />
                                                        </c:set>
                                                        <label for="password" class="form-label">Password:</label>
                                                        <form:input type="password"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            path="password" />
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="phone" class="form-label">Phone number:</label>
                                                        <form:input type="text" class="form-control" id="phone"
                                                            path="phone" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="fullName" />
                                                        </c:set>
                                                        <label for="fullName" class="form-label">Full name:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            path="fullName" />
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </div>

                                                    <div class="col-12">
                                                        <label for="address" class="form-label">Address:</label>
                                                        <form:input type="text" class="form-control" id="address"
                                                            path="address" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="role" class="form-label">Role:</label>
                                                        <form:select class="form-select" path="role.name">
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            name="file" accept=".png, .jpg, .jpeg" />
                                                    </div>

                                                    <div class="col-12 text-center">
                                                        <img id="avatarPreview" src="" alt="Avatar Preview"
                                                            style="display: none; max-width: 200px; height: 200px; object-fit: cover; margin: 20px auto; border: 1px solid #ddd; border-radius: 5px;">
                                                    </div>

                                                    <div class="col-12 mt-4 text-center">
                                                        <button type="submit" class="btn btn-primary px-5 py-2">Create
                                                            User</button>
                                                    </div>
                                                </div>
                                            </form:form>
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