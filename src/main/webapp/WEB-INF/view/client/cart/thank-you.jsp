<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>Cảm ơn - Laptop Shop</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <link href="/client/css/bootstrap.min.css" rel="stylesheet">
            <link href="/client/css/style.css" rel="stylesheet">
        </head>

        <body>
            <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

            <div class="container-fluid py-5 mt-5">
                <div class="container py-5 text-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <i class="bi bi-check-circle display-1 text-primary"></i>
                            <h1 class="display-3">Thank you!</h1>
                            <p class="mb-4">Your order has been placed successfully. We will contact you as soon as
                                possible.</p>
                            <a class="btn btn-primary border-3 border-primary rounded-pill py-3 px-5" href="/">Back to
                                Home</a>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
        </body>

        </html>