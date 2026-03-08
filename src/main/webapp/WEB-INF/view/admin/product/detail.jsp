<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>Product Details - Laptop Shop Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link href="/resources/css/styles.css" rel="stylesheet" />
                    <link href="/resources/css/premium-admin.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <%@ include file="../layout/header.jsp" %>
                        <div id="layoutSidenav">
                            <%@ include file="../layout/sidebar.jsp" %>
                                <div id="layoutSidenav_content">
                                    <main class="p-4">
                                        <div class="container-fluid">
                                            <div class="mb-4">
                                                <h1 class="page-title mb-0">Product Details</h1>
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb mb-0">
                                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                        <li class="breadcrumb-item"><a
                                                                href="/admin/product">Products</a>
                                                        </li>
                                                        <li class="breadcrumb-item active">View Details</li>
                                                    </ol>
                                                </nav>
                                            </div>

                                            <div class="card shadow-lg mb-5 border-0">
                                                <div class="card-header py-3">
                                                    <h5 class="card-title mb-0"><i
                                                            class="fas fa-laptop me-2"></i>Product:
                                                        ${product.name}</h5>
                                                </div>
                                                <div class="card-body p-0">
                                                    <div class="row g-0">
                                                        <!-- Product Image Section -->
                                                        <div class="col-md-5 bg-light d-flex align-items-center justify-content-center p-4"
                                                            style="min-height: 400px;">
                                                            <img src="/resources/images/product/${product.image}"
                                                                class="img-fluid rounded shadow-sm"
                                                                alt="${product.name}"
                                                                style="max-height: 350px; object-fit: contain;">
                                                        </div>

                                                        <!-- Product Info Section -->
                                                        <div class="col-md-7 p-4 p-lg-5">
                                                            <div
                                                                class="d-flex justify-content-between align-items-start mb-4">
                                                                <div>
                                                                    <h2 class="fw-bold text-dark mb-1">${product.name}
                                                                    </h2>
                                                                    <span
                                                                        class="badge bg-primary px-3 py-2 fs-6">#${product.id}</span>
                                                                </div>
                                                                <div class="text-end">
                                                                    <h3><span class="text-primary fw-bold"
                                                                            data-price="${product.price}">
                                                                            <fmt:formatNumber value="${product.price}"
                                                                                pattern="###,###,###" /> đ
                                                                        </span></h3>
                                                                    <small class="text-muted">Current Retail
                                                                        Price</small>
                                                                </div>
                                                            </div>

                                                            <hr class="my-4">

                                                            <div class="row g-4 mb-4">
                                                                <div class="col-6">
                                                                    <label
                                                                        class="text-muted small text-uppercase fw-bold">Manufacturer</label>
                                                                    <p class="fs-5 fw-semibold mb-0 text-dark">
                                                                        ${product.factory}</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label
                                                                        class="text-muted small text-uppercase fw-bold">Target
                                                                        Audience</label>
                                                                    <p class="fs-5 fw-semibold mb-0 text-dark">
                                                                        ${product.target}</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label
                                                                        class="text-muted small text-uppercase fw-bold">Stock
                                                                        Quantity</label>
                                                                    <p class="fs-5 fw-semibold mb-0 text-dark">
                                                                        ${product.quantity} Units</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label
                                                                        class="text-muted small text-uppercase fw-bold">Total
                                                                        Sold</label>
                                                                    <p class="fs-5 fw-semibold mb-0 text-success">
                                                                        ${product.sold} Units</p>
                                                                </div>
                                                            </div>

                                                            <div class="mb-4">
                                                                <label
                                                                    class="text-muted small text-uppercase fw-bold d-block mb-1">Short
                                                                    Description</label>
                                                                <p
                                                                    class="text-dark bg-light p-3 rounded border-start border-4 border-primary">
                                                                    ${product.shortDesc}
                                                                </p>
                                                            </div>

                                                            <div class="mb-5">
                                                                <label
                                                                    class="text-muted small text-uppercase fw-bold d-block mb-1">Detailed
                                                                    Features</label>
                                                                <p class="text-secondary" style="line-height: 1.7;">
                                                                    ${product.detailDesc}
                                                                </p>
                                                            </div>

                                                            <div class="d-flex gap-2">
                                                                <a href="/admin/product"
                                                                    class="btn btn-outline-secondary px-4">
                                                                    <i class="fas fa-arrow-left me-2"></i>Back to List
                                                                </a>
                                                                <a href="/admin/product/update/${product.id}"
                                                                    class="btn btn-warning text-white px-4 shadow-sm">
                                                                    <i class="fas fa-edit me-2"></i>Edit Product
                                                                </a>
                                                            </div>
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

                </html>