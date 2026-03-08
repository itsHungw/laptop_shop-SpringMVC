<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Sản Phẩm - Laptopshop</title>

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">


                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">

                    <style>
                        :root {
                            --primary-green: #8cc63f;
                            --secondary-orange: #ffb524;
                        }

                        body {
                            font-family: 'Inter', sans-serif;
                            background-color: #fff;
                        }

                        .breadcrumb-section {
                            margin-top: 150px;
                            margin-bottom: 30px;
                        }

                        .breadcrumb-item a {
                            color: #888;
                            text-decoration: none;
                        }

                        .breadcrumb-item.active {
                            color: #333;
                        }

                        .filter-section h5 {
                            font-weight: 600;
                            color: #666;
                            margin-bottom: 15px;
                            margin-top: 25px;
                        }

                        .form-check-label {
                            color: #666;
                            cursor: pointer;
                        }

                        .form-check-input:checked {
                            background-color: var(--primary-green);
                            border-color: var(--primary-green);
                        }

                        .product-card {
                            border: 1px solid #ffd891;
                            border-radius: 15px;
                            overflow: hidden;
                            transition: all 0.3s ease;
                            height: 100%;
                            display: flex;
                            flex-direction: column;
                        }

                        .product-card:hover {
                            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
                            transform: translateY(-5px);
                        }

                        .product-img-container {
                            position: relative;
                            padding: 20px;
                            background: #f8f9fa;
                        }

                        .product-img {
                            width: 100%;
                            height: auto;
                            object-fit: contain;
                        }

                        .category-badge {
                            position: absolute;
                            top: 15px;
                            left: 15px;
                            background-color: var(--secondary-orange);
                            color: white !important;
                            padding: 5px 15px;
                            border-radius: 5px;
                            font-size: 14px;
                            z-index: 1;
                        }

                        .product-info {
                            padding: 20px;
                            text-align: center;
                            flex-grow: 1;
                            display: flex;
                            flex-direction: column;
                            justify-content: space-between;
                        }

                        .product-name {
                            color: var(--primary-green);
                            font-weight: 600;
                            font-size: 1.1rem;
                            margin-bottom: 10px;
                            text-decoration: none;
                            display: block;
                        }

                        .product-specs {
                            color: #888;
                            font-size: 0.9rem;
                            margin-bottom: 15px;
                        }

                        .product-price {
                            font-size: 1.25rem;
                            font-weight: 700;
                            color: #333;
                            margin-bottom: 20px;
                        }

                        .btn-add-cart {
                            border: 1.5px solid var(--primary-green);
                            color: var(--primary-green);
                            background: transparent;
                            border-radius: 30px;
                            padding: 8px 25px;
                            font-weight: 600;
                            transition: all 0.2s;
                        }

                        .btn-add-cart:hover {
                            background-color: var(--primary-green);
                            color: white;
                        }

                        .pagination .page-link {
                            color: var(--primary-green);
                            border-radius: 50%;
                            margin: 0 5px;
                            width: 40px;
                            height: 40px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        }

                        .pagination .page-item.active .page-link {
                            background-color: var(--primary-green);
                            border-color: var(--primary-green);
                        }
                    </style>
                </head>

                <body>

                    <!-- Navbar start -->
                    <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                    <!-- Navbar End -->

                    <div class="container breadcrumb-section">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm</li>
                            </ol>
                        </nav>
                    </div>

                    <div class="container pb-5">
                        <form action="/products" method="get" id="filterForm">
                            <input type="hidden" name="page" value="1" id="pageInput">
                            <div class="row">
                                <!-- Sidebar Filters -->
                                <div class="col-lg-3">
                                    <div class="filter-section">
                                        <h5>Hãng sản xuất</h5>
                                        <div class="row">
                                            <c:forEach var="f"
                                                items="${['Apple(mac)', 'Asus', 'Lenovo', 'Dell', 'LG', 'Acer', 'MSI', 'HP']}">
                                                <div class="col-6 mb-2">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="factory"
                                                            value="${f}" id="factory-${f}" <c:forEach var="v"
                                                            items="${paramValues.factory}">
                                                        <c:if test="${v == f}">checked</c:if>
                                            </c:forEach>>
                                            <label class="form-check-label" for="factory-${f}">${f}</label>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>

                                <h5>Mục đích sử dụng</h5>
                                <c:forEach var="t" items="${['Gaming', 'Office', 'Premium']}">
                                    <div class="mb-2">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="target" value="${t}"
                                                id="target-${t}" <c:forEach var="v" items="${paramValues.target}">
                                            <c:if test="${v == t}">checked</c:if>
                                </c:forEach>>
                                <label class="form-check-label" for="target-${t}">${t == 'Office' ? 'Sinh viên - văn
                                    phòng' : (t == 'Premium' ? 'Thiết kế đồ họa' : t)}</label>
                            </div>
                    </div>
                    </c:forEach>

                    <h5>Mức giá</h5>
                    <div class="mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="price" value="under-10" id="price-1"
                                <c:forEach var="v" items="${paramValues.price}">
                            <c:if test="${v == 'under-10'}">checked</c:if>
                            </c:forEach>>
                            <label class="form-check-label" for="price-1">Dưới 10 triệu</label>
                        </div>
                    </div>
                    <div class="mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="price" value="10-15" id="price-2"
                                <c:forEach var="v" items="${paramValues.price}">
                            <c:if test="${v == '10-15'}">checked</c:if>
                            </c:forEach>>
                            <label class="form-check-label" for="price-2">Từ 10 - 15 triệu</label>
                        </div>
                    </div>
                    <div class="mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="price" value="15-20" id="price-3"
                                <c:forEach var="v" items="${paramValues.price}">
                            <c:if test="${v == '15-20'}">checked</c:if>
                            </c:forEach>>
                            <label class="form-check-label" for="price-3">Từ 15 - 20 triệu</label>
                        </div>
                    </div>
                    <div class="mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="price" value="above-20" id="price-4"
                                <c:forEach var="v" items="${paramValues.price}">
                            <c:if test="${v == 'above-20'}">checked</c:if>
                            </c:forEach>>
                            <label class="form-check-label" for="price-4">Trên 20 triệu</label>
                        </div>
                    </div>

                    <h5>Sắp xếp</h5>
                    <div class="mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="sort" value="gia-tang-dan" id="sort-1"
                                ${(empty param.sort or param.sort=='gia-tang-dan' ) ? 'checked' : '' }>
                            <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                        </div>
                    </div>
                    <div class="mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="sort" value="gia-giam-dan" id="sort-2"
                                ${param.sort=='gia-giam-dan' ? 'checked' : '' }>
                            <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                        </div>
                    </div>
                    </div>
                    </div>

                    <!-- Product Grid -->
                    <div class="col-lg-9">
                        <div class="row g-4">
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-6 col-lg-4">
                                    <div class="product-card">
                                        <div class="product-img-container">
                                            <span class="category-badge">Laptop</span>
                                            <img src="/images/product/${product.image}" class="product-img"
                                                alt="${product.name}">
                                        </div>
                                        <div class="product-info">
                                            <div>
                                                <a href="/product/${product.id}" class="product-name">
                                                    ${product.name}
                                                </a>
                                                <p class="product-specs">
                                                    ${product.shortDesc}
                                                </p>
                                            </div>
                                            <div>
                                                <p class="product-price">
                                                    <fmt:formatNumber value="${product.price}" pattern="###,###,###" />
                                                    đ
                                                </p>
                                                <form action="/add-product-to-cart/${product.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit" class="btn btn-add-cart">
                                                        <i class="fas fa-cart-plus me-2"></i> Add to cart
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty products}">
                                <div class="col-12 text-center py-5">
                                    <h3 class="text-muted">Không tìm thấy sản phẩm nào</h3>
                                </div>
                            </c:if>
                        </div>

                        <!-- Pagination -->
                        <div class="row mt-5">
                            <div class="col-12 d-flex justify-content-center">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination d-flex flex-row">
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="/products?page=${currentPage - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="/products?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${currentPage < totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="/products?page=${currentPage + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    </div>
                    </form>
                    </div>

                    <!-- Footer can be added here if available -->

                    <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

                    <script>
                        $(document).ready(function () {
                            // Auto submit formal when any input changes
                            $('.form-check-input').change(function () {
                                $('#filterForm').submit();
                            });

                            // Handle pagination click
                            $('.page-link').click(function (e) {
                                e.preventDefault();
                                const page = $(this).attr('href').split('page=')[1].split('&')[0];
                                $('#pageInput').val(page);
                                $('#filterForm').submit();
                            });
                        });
                    </script>

                </body>

                </html>