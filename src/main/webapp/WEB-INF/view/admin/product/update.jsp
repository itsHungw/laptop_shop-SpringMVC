<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Update Product - Laptop Shop Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="/resources/css/styles.css" rel="stylesheet" />
                <link href="/resources/css/premium-admin.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const imageFile = $("#imageFile");
                        imageFile.change(function (e) {
                            if (e.target.files && e.target.files[0]) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#imagePreview").attr("src", imgURL).show();
                            }
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <%@ include file="../layout/header.jsp" %>
                    <div id="layoutSidenav">
                        <%@ include file="../layout/sidebar.jsp" %>
                            <div id="layoutSidenav_content">
                                <main class="p-4">
                                    <div class="container-fluid">
                                        <div class="mb-4">
                                            <h1 class="page-title mb-0">Update Product</h1>
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb mb-0">
                                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                    <li class="breadcrumb-item"><a href="/admin/product">Products</a>
                                                    </li>
                                                    <li class="breadcrumb-item active">Update</li>
                                                </ol>
                                            </nav>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-10 col-xl-8 mx-auto">
                                                <div class="card mb-5">
                                                    <div class="card-header">
                                                        <i class="fas fa-edit me-2"></i>Product Information -
                                                        #${product.id}
                                                    </div>
                                                    <div class="card-body p-4">
                                                        <form:form action="/admin/product/update" method="post"
                                                            modelAttribute="product" enctype="multipart/form-data">

                                                            <form:input type="hidden" path="id" />

                                                            <div class="row mb-4">
                                                                <div class="col-md-6 mb-3">
                                                                    <label for="name" class="form-label">Product
                                                                        Name</label>
                                                                    <form:input type="text" class="form-control"
                                                                        id="name" name="name" path="name"
                                                                        placeholder="Enter product name" />
                                                                </div>
                                                                <div class="col-md-6 mb-3">
                                                                    <label for="price" class="form-label">Price
                                                                        (VND)</label>
                                                                    <form:input type="number" class="form-control"
                                                                        id="price" name="price" path="price"
                                                                        placeholder="e.g. 15000000" />
                                                                </div>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <div class="col-md-6 mb-3">
                                                                    <label for="factory"
                                                                        class="form-label">Manufacturer</label>
                                                                    <form:select class="form-select" id="factory"
                                                                        name="factory" path="factory">
                                                                        <form:option value="Dell" label="Dell" />
                                                                        <form:option value="HP" label="HP" />
                                                                        <form:option value="Lenovo" label="Lenovo" />
                                                                        <form:option value="Asus" label="Asus" />
                                                                        <form:option value="Acer" label="Acer" />
                                                                        <form:option value="MSI" label="MSI" />
                                                                        <form:option value="Apple" label="Apple" />
                                                                        <form:option value="Razer" label="Razer" />
                                                                        <form:option value="Microsoft"
                                                                            label="Microsoft" />
                                                                        <form:option value="LG" label="LG" />
                                                                        <form:option value="Samsung" label="Samsung" />
                                                                        <form:option value="Other" label="Other" />
                                                                    </form:select>
                                                                </div>
                                                                <div class="col-md-6 mb-3">
                                                                    <label for="shortDesc" class="form-label">Short
                                                                        Description</label>
                                                                    <form:input type="text" class="form-control"
                                                                        id="shortDesc" name="shortDesc" path="shortDesc"
                                                                        placeholder="Brief tagline" />
                                                                </div>
                                                            </div>

                                                            <div class="mb-4">
                                                                <label for="detailDesc" class="form-label">Detailed
                                                                    Description</label>
                                                                <form:textarea class="form-control" id="detailDesc"
                                                                    name="detailDesc" path="detailDesc" rows="4"
                                                                    placeholder="Describe the product features..." />
                                                            </div>

                                                            <div class="row mb-4">
                                                                <div class="col-md-12">
                                                                    <label for="imageFile"
                                                                        class="form-label d-block text-center">Product
                                                                        Image</label>
                                                                    <div class="img-preview-container mx-auto"
                                                                        style="max-width: 500px;">
                                                                        <div class="mb-3">
                                                                            <img src="/resources/images/product/${product.image}"
                                                                                id="imagePreview" alt="Image Preview"
                                                                                class="img-fluid rounded"
                                                                                style="max-height: 250px; object-fit: contain;">
                                                                        </div>
                                                                        <input class="form-control" type="file"
                                                                            id="imageFile" name="imageFile"
                                                                            accept=".png, .jpg, .jpeg" />
                                                                        <div class="form-text mt-2 text-muted">Upload a
                                                                            high-quality image of the laptop.</div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex justify-content-end gap-2 mt-4">
                                                                <a href="/admin/product"
                                                                    class="btn btn-secondary px-4">Cancel</a>
                                                                <button type="submit"
                                                                    class="btn btn-premium px-5 shadow">Save
                                                                    Changes</button>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                                <%@ include file="../layout/footer.jsp" %>
                            </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/resources/js/scripts.js"></script>
            </body>