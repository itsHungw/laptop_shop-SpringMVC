<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Delete Product - Laptop Shop Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                                        <div class="mb-4 text-center">
                                            <h1 class="page-title mb-0">Delete Confirmation</h1>
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb justify-content-center mb-0">
                                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                    <li class="breadcrumb-item"><a href="/admin/product">Products</a>
                                                    </li>
                                                    <li class="breadcrumb-item active">Delete</li>
                                                </ol>
                                            </nav>
                                        </div>

                                        <div class="row justify-content-center">
                                            <div class="col-lg-6 col-md-8">
                                                <div class="card shadow-lg border-0 overflow-hidden">
                                                    <div class="card-header bg-danger text-white py-3">
                                                        <h5 class="card-title mb-0 text-center">
                                                            <i class="fas fa-exclamation-triangle me-2"></i>Critical
                                                            Action
                                                        </h5>
                                                    </div>
                                                    <div class="card-body p-4 text-center">
                                                        <div class="mb-4">
                                                            <div class="mx-auto bg-light rounded-circle d-flex align-items-center justify-content-center mb-3"
                                                                style="width: 100px; height: 100px;">
                                                                <i class="fas fa-trash-alt text-danger fa-3x"></i>
                                                            </div>
                                                            <h3 class="fw-bold mb-2">Are you sure?</h3>
                                                            <p class="text-muted">You are about to permanently delete
                                                                this product from the inventory.</p>
                                                        </div>

                                                        <div class="bg-light p-4 rounded-3 text-start mb-4 border">
                                                            <div class="d-flex align-items-center mb-3">
                                                                <img src="/resources/images/product/${product.image}"
                                                                    class="rounded me-3 border"
                                                                    style="width: 60px; height: 60px; object-fit: cover;">
                                                                <div>
                                                                    <div class="fw-bold fs-5 text-dark">${product.name}
                                                                    </div>
                                                                    <div class="text-primary small">ID: #${product.id}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row small text-muted">
                                                                <div class="col-6 mb-2"><strong>Manufacturer:</strong>
                                                                    ${product.factory}</div>
                                                                <div class="col-6 mb-2"><strong>Price:</strong>
                                                                    ${product.price} VND</div>
                                                            </div>
                                                        </div>

                                                        <div class="alert alert-warning border-start border-4 border-warning mb-4"
                                                            role="alert">
                                                            <i class="fas fa-info-circle me-2"></i> This action cannot
                                                            be undone. All data related to this product will be removed.
                                                        </div>

                                                        <form:form method="post" action="/admin/product/delete"
                                                            modelAttribute="product">
                                                            <form:hidden path="id" />
                                                            <div
                                                                class="d-grid gap-2 d-md-flex justify-content-md-center">
                                                                <a href="/admin/product"
                                                                    class="btn btn-light px-4 border">Cancel, Keep
                                                                    it</a>
                                                                <button type="submit"
                                                                    class="btn btn-danger px-5 shadow-sm fw-bold">Yes,
                                                                    Delete Product</button>
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

            </html>