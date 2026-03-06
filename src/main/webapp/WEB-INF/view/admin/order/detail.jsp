<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Order Detail - Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Order Detail ID: ${id}</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/order">Orders</a></li>
                                    <li class="breadcrumb-item active">View Detail</li>
                                </ol>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Receiver Info
                                            </div>
                                            <div class="card-body">
                                                <p><strong>Name:</strong> ${order.receiverName}</p>
                                                <p><strong>Phone:</strong> ${order.receiverPhone}</p>
                                                <p><strong>Address:</strong> ${order.receiverAddress}</p>
                                                <p><strong>Notes:</strong> ${order.notes}</p>
                                                <p><strong>Status:</strong> ${order.status}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-table me-1"></i>
                                                Products in Order
                                            </div>
                                            <div class="card-body">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Product Name</th>
                                                            <th>Price</th>
                                                            <th>Quantity</th>
                                                            <th>Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="detail" items="${orderDetails}"
                                                            varStatus="status">
                                                            <tr>
                                                                <td>${status.index + 1}</td>
                                                                <td>${detail.product.name}</td>
                                                                <td>
                                                                    <fmt:formatNumber value="${detail.price}"
                                                                        pattern="###,###,###" /> đ
                                                                </td>
                                                                <td>${detail.quantity}</td>
                                                                <td>
                                                                    <fmt:formatNumber
                                                                        value="${detail.price * detail.quantity}"
                                                                        pattern="###,###,###" /> đ
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr>
                                                            <td colspan="4" class="text-end"><strong>Grand
                                                                    Total:</strong></td>
                                                            <td>
                                                                <strong>
                                                                    <fmt:formatNumber value="${order.totalPrice}"
                                                                        pattern="###,###,###" /> đ
                                                                </strong>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>