# 💻 Laptop Shop - Spring Boot MVC Project

[![Spring Boot](https://img.shields.io/badge/Spring--Boot-3.4.3-brightgreen)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-21-orange)](https://www.oracle.com/java/)


---

### 🌐 Select Language:
- [English](#en-english)
- [Tiếng Việt](#vn-tiếng-việt)

---

<a name="en-english"></a>
## 🇬🇧 English

### 📝 Overview
**Laptop Shop** is a modern e-commerce web application specialized in laptops, built using the **Spring Boot** framework. The project implements a robust architecture with a client-facing store and a comprehensive admin management panel.

### 🚀 Key Features
#### **🛒 Client Side**
- **Authentication**: Secure register, login, and logout.
- **Product Explorer**:
    - Browse products by category.
    - **Advanced Filter**: Filter by Brand (Apple, Asus, MSI, etc.), Purpose (Gaming, Office), and Price Range.
    - **Smart Sorting**: Sort by price (Ascending/Descending).
    - **Dynamic Pagination**: Smooth navigation through large product sets.
- **Shopping Cart**: Add/remove products, update quantities, and persistent storage.
- **User Profile**: Manage personal information and avatars.

#### **🔒 Admin Side (Dashboard)**
- **User Management**: Manage accounts and roles.
- **Product Management**: Full CRUD (Create, Read, Update, Delete) with image upload support.
- **Order Management**: Track and update status of customer orders.
- **Statistics**: Overview of system metrics.

### 🛠️ Tech Stack
- **Backend**: Java 21, Spring Boot 3.4.3, Spring MVC, Spring Data JPA, Spring Security.
- **Database**: MySQL.
- **Frontend**: JSP, JSTL, Bootstrap 5, FontAwesome, jQuery.
- **Validation**: Spring Boot Validation (Hibernate Validator).

### ⚙️ Setup & Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/itsHungw/laptop_shop-SpringMVC.git
   cd laptop-shop
   ```
2. **Database configuration**:
   - Create a database named `laptop_shop` in MySQL.
   - Update `src/main/resources/application.properties` with your credentials:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/laptop_shop
     spring.datasource.username=your_username
     spring.datasource.password=your_password
     ```
3. **Run the application**:
   ```bash
   ./mvnw spring-boot:run
   ```

---

<a name="vn-tiếng-việt"></a>
## 🇻🇳 Tiếng Việt

### 📝 Giới thiệu
**Laptop Shop** là một ứng dụng web thương mại điện tử hiện đại chuyên về laptop, được xây dựng trên nền tảng **Spring Boot**. Dự án triển khai kiến trúc mạnh mẽ với đầy đủ giao diện cho khách hàng và bảng quản trị (Admin panel) toàn diện.

### 🚀 Các Tính Năng Chính
#### **🛒 Phía Người Dùng (Client)**
- **Xác thực**: Đăng ký, đăng nhập và đăng xuất bảo mật.
- **Khám phá sản phẩm**:
    - Duyệt sản phẩm theo danh mục.
    - **Bộ lọc nâng cao**: Lọc theo Hãng (Apple, Asus, MSI...), Mục đích sử dụng (Gaming, Văn phòng) và Khoảng giá.
    - **Sắp xếp thông minh**: Sắp xếp theo giá (Tăng dần/Giảm dần).
    - **Phân trang động**: Điều hướng mượt mà qua danh sách sản phẩm lớn.
- **Giỏ hàng**: Thêm/xóa sản phẩm, cập nhật số lượng và lưu trữ trạng thái.
- **Hồ sơ cá nhân**: Quản lý thông tin cá nhân và ảnh đại diện.

#### **🔒 Phía Quản Trị (Admin)**
- **Quản lý người dùng**: Quản lý tài khoản và phân quyền.
- **Quản lý sản phẩm**: Đầy đủ CRUD (Thêm, Xem, Sửa, Xóa) tích hợp tải lên hình ảnh.
- **Quản lý đơn hàng**: Theo dõi và cập nhật trạng thái đơn hàng của khách.
- **Thống kê**: Tổng quan các chỉ số của hệ thống.

### 🛠️ Công Nghệ Sử Dụng
- **Backend**: Java 21, Spring Boot 3.4.3, Spring MVC, Spring Data JPA, Spring Security.
- **Cơ sở dữ liệu**: MySQL.
- **Frontend**: JSP, JSTL, Bootstrap 5, FontAwesome, jQuery.
- **Validation**: Spring Boot Validation (Hibernate Validator).

### ⚙️ Hướng Dẫn Cài Đặt
1. **Clone project**:
   ```bash
   git clone https://github.com/itsHungw/laptop_shop-SpringMVC.git
   cd laptop-shop
   ```
2. **Cấu hình Database**:
   - Tạo database tên `laptop_shop` trong MySQL.
   - Cập nhật file `src/main/resources/application.properties` với thông tin của bạn:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/laptop_shop
     spring.datasource.username=your_username
     spring.datasource.password=your_password
     ```
3. **Chạy ứng dụng**:
   ```bash
   ./mvnw spring-boot:run
   ```

---
*Created with ❤️ by itsHungw*
