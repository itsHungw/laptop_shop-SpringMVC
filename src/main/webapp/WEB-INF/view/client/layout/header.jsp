<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

            <div class="container-fluid fixed-top">

                <div class="container px-0">
                    <nav class="navbar navbar-light bg-white navbar-expand-xl">
                        <a href="/" class="navbar-brand">
                            <h1 class="text-primary display-6">Laptop Shop</h1>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-white d-flex justify-content-between mx-5"
                            id="navbarCollapse">
                            <div class="navbar-nav ">
                                <a href="/" class="nav-item nav-link">Trang Chủ</a>
                                <a href="/products" class="nav-item nav-link">Sản Phẩm</a>
                                <!-- <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="cart.html" class="dropdown-item">Cart</a>
                            <a href="chackout.html" class="dropdown-item">Chackout</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div> -->
                            </div>
                            <div class="d-flex m-3 me-0">

                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <a href="/cart" class="position-relative me-4 my-auto">
                                        <i class="fa fa-shopping-bag fa-2x"></i>
                                        <span
                                            class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                            style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                                            ${sessionScope.sum}
                                        </span>
                                    </a>
                                    <div class="dropdown my-auto">
                                        <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                            data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                            <i class="fas fa-user fa-2x"></i>
                                        </a>

                                        <ul class="dropdown-menu dropdown-menu-end p-4" aria-
                                            labelledby="dropdownMenuLink">

                                            <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                    src="/images/avatar/${sessionScope.avatar}" />
                                                <div class="text-center my-3">
                                                    <c:if test="${not empty pageContext.request.userPrincipal}">
                                                        User
                                                        <c:out value="${pageContext.request.userPrincipal.name}" />
                                                    </c:if>
                                                </div>
                                            </li>
                                            <li><a class="dropdown-item" href="/profile">Quản lý tài khoản</a></li>
                                            <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button type="submit" class="dropdown-item">Đăng xuất</button>
                                            </form>
                                        </ul>
                                    </div>
                                    <c:out value="${pageContext.request.userPrincipal.name}" />
                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a class="btn btn-primary" href="/login">Login</a>
                                </c:if>


                            </div>
                        </div>
                    </nav>
                </div>
            </div>