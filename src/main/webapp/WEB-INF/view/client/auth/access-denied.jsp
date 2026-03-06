<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8">
            <title>Truy cập bị từ chối - Laptop Shop</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">

            <!-- Fonts & Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

            <style>
                body {
                    background-color: #f8f9fa;
                    height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-family: 'Inter', system-ui, -apple-system, sans-serif;
                    margin: 0;
                }

                .error-card {
                    background: #ffffff;
                    padding: 3.5rem;
                    border-radius: 24px;
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.05);
                    max-width: 550px;
                    width: 90%;
                    text-align: center;
                    transition: transform 0.3s ease;
                }

                .error-card:hover {
                    transform: translateY(-5px);
                }

                .icon-box {
                    font-size: 5.5rem;
                    background: linear-gradient(135deg, #ff7675, #d63031);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    margin-bottom: 1.5rem;
                }

                h1 {
                    font-weight: 800;
                    color: #2d3436;
                    font-size: 2.2rem;
                    margin-bottom: 1rem;
                }

                p {
                    color: #636e72;
                    font-size: 1.1rem;
                    line-height: 1.6;
                    margin-bottom: 2.5rem;
                }

                .btn-primary-custom {
                    background: #3498db;
                    color: white;
                    border: none;
                    padding: 0.9rem 2.2rem;
                    border-radius: 12px;
                    font-weight: 600;
                    text-decoration: none;
                    display: inline-flex;
                    align-items: center;
                    gap: 10px;
                    transition: all 0.3s;
                }

                .btn-primary-custom:hover {
                    background: #2980b9;
                    box-shadow: 0 8px 20px rgba(52, 152, 219, 0.3);
                    color: #fff;
                }

                .btn-outline-custom {
                    border: 2px solid #edeff2;
                    color: #636e72;
                    padding: 0.8rem 1.8rem;
                    border-radius: 12px;
                    font-weight: 600;
                    text-decoration: none;
                    transition: all 0.3s;
                }

                .btn-outline-custom:hover {
                    background: #f1f2f6;
                    border-color: #e2e5e9;
                    color: #2d3436;
                }
            </style>
        </head>

        <body>
            <div class="error-card">
                <div class="icon-box">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h1>403 - Truy cập bị chặn</h1>
                <p>Rất tiếc! Bạn không có quyền truy cập vào trang này. Khu vực này chỉ dành cho tài khoản có quyền hạn
                    cao hơn (như Quản trị viên).</p>

                <div class="d-flex flex-column flex-sm-row justify-content-center gap-3">
                    <a href="/" class="btn-primary-custom">
                        <i class="fas fa-home"></i> Quay về trang chủ
                    </a>
                    <a href="/login" class="btn-outline-custom">
                        <i class="fas fa-sign-in-alt"></i> Đăng nhập lại
                    </a>
                </div>
            </div>
        </body>

        </html>