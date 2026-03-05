<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Manage Products - Laptop Shop Admin" />
                <title>Products Management - SB Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/resources/css/styles.css" rel="stylesheet" />
                <link href="/resources/css/premium-admin.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <%@ include file="../layout/header.jsp" %>
                    <div id="layoutSidenav">
                        <%@ include file="../layout/sidebar.jsp" %>
                            <div id="layoutSidenav_content">
                                <main class="p-4">
                                    <div class="container-fluid">
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <div>
                                                <h1 class="page-title mb-0">Manage Products</h1>
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb mb-0">
                                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                        <li class="breadcrumb-item active">Products</li>
                                                    </ol>
                                                </nav>
                                            </div>
                                            <a href="/admin/product/create" class="btn btn-primary shadow">
                                                <i class="fas fa-plus-circle me-2"></i>Add New Product
                                            </a>
                                        </div>

                                        <div class="card mb-4 mt-3">
                                            <div class="card-header d-flex align-items-center justify-content-between">
                                                <div>
                                                    <i class="fas fa-table me-1"></i>
                                                    Product Catalog
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-premium table-hover align-middle mb-0"
                                                        id="datatablesSimple">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Product Name</th>
                                                                <th>Price (VND)</th>
                                                                <th>Factory</th>
                                                                <th class="text-center">Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="product" items="${products}">
                                                                <tr>
                                                                    <td class="fw-bold text-muted">#${product.id}</td>
                                                                    <td>
                                                                        <div class="d-flex align-items-center">
                                                                            <img src="/resources/images/product/${product.image}"
                                                                                alt="${product.name}"
                                                                                class="rounded me-3"
                                                                                style="width: 45px; height: 45px; object-fit: cover; border: 1px solid #eee;">
                                                                            <div class="fw-semibold">${product.name}
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <span class="text-primary fw-bold"
                                                                            data-price="${product.price}">
                                                                            <c:set var="formattedPrice"
                                                                                value="${product.price}" />
                                                                            ${product.price}
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <h4 class="text-center"> <span
                                                                                class="badge bg-light text-dark border">
                                                                                ${product.factory}</span></h4>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <div
                                                                            class="d-flex justify-content-center gap-2">
                                                                            <a href="/admin/product/${product.id}"
                                                                                class="btn btn-success">View</a>
                                                                            <a href="/admin/product/update/${product.id}"
                                                                                class="btn btn-warning">Update</a>
                                                                            <a href="/admin/product/delete/${product.id}"
                                                                                class="btn btn-danger">Delete</a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
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
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/resources/js/datatables-simple-demo.js"></script>
            </body>

            </html>