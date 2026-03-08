<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Lịch sử đơn hàng - Laptop Shop</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-5 mt-5">
                            <ol class="breadcrumb justify-content-center mb-0">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active text-dark">Order History</li>
                            </ol>
                        </div>
                        <h1 class="mb-4 text-center">Lịch sử mua hàng</h1>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead class="bg-light">
                                    <tr>
                                        <th scope="col">ID Đơn hàng</th>
                                        <th scope="col">Ngày đặt</th>
                                        <th scope="col">Người nhận</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th scope="col">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty orders}">
                                        <tr>
                                            <td colspan="5" class="text-center">Bạn chưa có đơn hàng nào.</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>---</td> <!-- Could add date if field exists -->
                                            <td>${order.receiverName}</td>
                                            <td>
                                                <fmt:formatNumber value="${order.totalPrice}" pattern="###,###,###" /> đ
                                            </td>
                                            <td>
                                                <span
                                                    class="badge ${order.status == 'PENDING' ? 'bg-warning' : (order.status == 'SHIPPING' ? 'bg-info' : (order.status == 'COMPLETED' ? 'bg-success' : 'bg-danger'))}">
                                                    ${order.status}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
            </body>

            </html>