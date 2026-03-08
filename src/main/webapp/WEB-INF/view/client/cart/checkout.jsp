<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Thanh toán - Laptop Shop</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

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

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->


                <!-- Navbar start -->
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                <!-- Navbar End -->


                <!-- Checkout Page Start -->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-5 mt-5">
                            <ol class="breadcrumb justify-content-center mb-0">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active text-dark">Checkout</li>
                            </ol>
                        </div>
                        <h1 class="mb-4">Chi tiết đơn hàng</h1>
                        <form action="/place-order" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="row g-5">
                                <div class="col-md-12 col-lg-6 col-xl-7">
                                    <div class="form-item">
                                        <label class="form-label my-3">Tên người nhận<sup>*</sup></label>
                                        <input type="text" name="receiverName" class="form-control" required>
                                    </div>
                                    <div class="form-item">
                                        <label class="form-label my-3">Địa chỉ nhận hàng<sup>*</sup></label>
                                        <input type="text" name="receiverAddress" class="form-control"
                                            placeholder="Số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố" required>
                                    </div>
                                    <div class="form-item">
                                        <label class="form-label my-3">Số điện thoại<sup>*</sup></label>
                                        <input type="tel" name="receiverPhone" class="form-control" required>
                                    </div>
                                    <div class="mt-4">
                                        <label class="form-label my-3">Ghi chú (Tùy chọn)</label>
                                        <textarea name="notes" class="form-control" spellcheck="false" cols="30"
                                            rows="5" placeholder="Ghi chú về đơn hàng của bạn"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-6 col-xl-5">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Sản phẩm</th>
                                                    <th scope="col">Tên</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Tổng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cartDetail" items="${cartDetails}">
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="d-flex align-items-center mt-2">
                                                                <img src="/images/product/${cartDetail.product.image}"
                                                                    class="img-fluid rounded-circle"
                                                                    style="width: 60px; height: 60px;" alt="">
                                                            </div>
                                                        </th>
                                                        <td class="py-5">${cartDetail.product.name}</td>
                                                        <td class="py-5">
                                                            <fmt:formatNumber value="${cartDetail.price}"
                                                                pattern="###,###,###" /> đ
                                                        </td>
                                                        <td class="py-5">${cartDetail.quantity}</td>
                                                        <td class="py-5">
                                                            <fmt:formatNumber
                                                                value="${cartDetail.price * cartDetail.quantity}"
                                                                pattern="###,###,###" /> đ
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <th scope="row">
                                                    </th>
                                                    <td class="py-5"></td>
                                                    <td class="py-5"></td>
                                                    <td class="py-5">
                                                        <p class="mb-0 text-dark py-3">TẠM TÍNH</p>
                                                    </td>
                                                    <td class="py-5">
                                                        <div class="py-3 border-bottom border-top">
                                                            <p class="mb-0 text-dark">
                                                                <fmt:formatNumber value="${totalPrice}"
                                                                    pattern="###,###,###" /> đ
                                                            </p>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                    </th>
                                                    <td class="py-5">
                                                        <p class="mb-0 text-dark py-4">PHÍ VẬN CHUYỂN</p>
                                                    </td>
                                                    <td colspan="3" class="py-5">
                                                        <div class="form-check text-start mt-3">
                                                            <input type="checkbox"
                                                                class="form-check-input bg-primary border-0"
                                                                id="Shipping-1" name="Shipping-1" value="Shipping"
                                                                checked disabled>
                                                            <label class="form-check-input-label" for="Shipping-1">Miễn
                                                                phí vận chuyển</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                    </th>
                                                    <td class="py-5">
                                                        <p class="mb-0 text-dark text-uppercase py-3">TỔNG CỘNG</p>
                                                    </td>
                                                    <td class="py-5"></td>
                                                    <td class="py-5"></td>
                                                    <td class="py-5">
                                                        <div class="py-3 border-bottom border-top">
                                                            <p class="mb-0 text-dark">
                                                                <fmt:formatNumber value="${totalPrice}"
                                                                    pattern="###,###,###" /> đ
                                                            </p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                        <button type="submit"
                                            class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Đặt
                                            hàng</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Checkout Page End -->


                <!-- Footer Start -->
                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
                <!-- Copyright End -->



                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>