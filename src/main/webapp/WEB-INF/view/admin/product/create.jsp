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
                        const avatarFile = $("#imageFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
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
                                            <h1 class="text-center mb-5">Create Product</h1>
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="name" />
                                                        </c:set>
                                                        <label for="name" class="form-label">Product name:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            path="name" />
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </div>

                                                    <!-- <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="price" />
                                                        </c:set>
                                                        <label for="price" class="form-label">Price:</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            path="price" />
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </div> -->

                                                    <div class="col-md-6">
                                                        <label for="price" class="form-label">Price:</label>
                                                        <form:input type="number" class="form-control" path="price" />
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </div>

                                                    <div class="col-md-12">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="detailDesc" />
                                                        </c:set>
                                                        <label for="detailDesc" class="form-label">Detail
                                                            Description:</label>
                                                        <form:textarea
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            id="detailDesc" path="detailDesc" />
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="quantity" />
                                                        </c:set>
                                                        <label for="quantity" class="form-label">Quantity:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            id="quantity" path="quantity" />
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <c:set var="nameHasBindError">
                                                            <form:errors path="shortDesc" />
                                                        </c:set>
                                                        <label for="shortDesc" class="form-label">Short
                                                            Description:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty nameHasBindError? 'is-invalid':''}"
                                                            id="shortDesc" path="shortDesc" />
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </div>


                                                    <div class="col-md-6">
                                                        <label for="factory" class="form-label">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="Apple(mac)">Apple(mac)</form:option>
                                                            <form:option value="MSI">MSI</form:option>
                                                            <form:option value="Acer">Acer</form:option>
                                                            <form:option value="Dell">Dell</form:option>
                                                            <form:option value="HP">HP</form:option>
                                                            <form:option value="Lenovo">Lenovo</form:option>
                                                            <form:option value="Asus">Asus</form:option>
                                                            <form:option value="Other">Other</form:option>
                                                        </form:select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label for="target" class="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="Gaming">Gaming</form:option>
                                                            <form:option value="Office">Office</form:option>
                                                            <form:option value="Premium">Premium</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="imageFile" class="form-label">Image:</label>
                                                        <input class="form-control" type="file" id="imageFile"
                                                            name="imageFile" accept=".png, .jpg, .jpeg, .webp" />
                                                    </div>

                                                    <div class="col-md-6 text-center">
                                                        <img id="imagePreview" src="" alt="Image Preview"
                                                            style="display: none; max-width: 200px; height: 200px; object-fit: cover; margin: 20px auto; border: 1px solid #ddd; border-radius: 5px;">
                                                    </div>

                                                    <div class="col-12 mt-4 text-center mb-5">
                                                        <button type="submit" class="btn btn-primary px-5 py-2">Create
                                                            Product</button>
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