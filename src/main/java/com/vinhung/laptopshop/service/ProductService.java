package com.vinhung.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.vinhung.laptopshop.domain.Cart;
import com.vinhung.laptopshop.domain.CartDetail;
import com.vinhung.laptopshop.domain.Order;
import com.vinhung.laptopshop.domain.OrderDetail;
import com.vinhung.laptopshop.domain.Product;
import com.vinhung.laptopshop.domain.User;
import com.vinhung.laptopshop.repository.CartDetailRepository;
import com.vinhung.laptopshop.repository.CartRepository;
import com.vinhung.laptopshop.repository.OrderDetailRepository;
import com.vinhung.laptopshop.repository.OrderRepository;
import com.vinhung.laptopshop.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class ProductService {

    private final ProductRepository productRepository;
    private final UploadFileService uploadFileService;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final UserService userService;

    public ProductService(
            ProductRepository productRepository,
            UploadFileService uploadFileService,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository,
            UserService userService) {
        this.productRepository = productRepository;
        this.uploadFileService = uploadFileService;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.userService = userService;
    }

    public Product save(Product product, MultipartFile file) {
        String image = this.uploadFileService.uploadFile(file, "product");
        product.setImage(image);
        return productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public Product updateProduct(Product product, MultipartFile file) {
        String image = this.uploadFileService.uploadFile(file, "product");
        product.setImage(image);
        return productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {

        User user = this.userService.findByEmail(email);
        if (user != null) {
            // check user đã có Cart chưa ? nếu chưa tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id
            Product p = this.getProductById(productId);
            if (p != null) {

                // check sản phẩm đã có trong giỏ hàng chưa ?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, p);

                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(p);
                    cd.setPrice(p.getPrice());
                    cd.setQuantity(1);
                    this.cartDetailRepository.save(cd);

                    // update cart (sum)
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }

    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        CartDetail cd = this.cartDetailRepository.findById(cartDetailId).orElse(null);
        if (cd != null) {
            Cart cart = cd.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (cart.getSum() > 1) {
                int s = cart.getSum() - 1;
                cart.setSum(s);
                this.cartRepository.save(cart);
                session.setAttribute("sum", s);
            } else {
                // clear cart from user
                User user = cart.getUser();
                if (user != null) {
                    user.setCart(null);
                }
                this.cartRepository.deleteById(cart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartDetail(long cartDetailId, int quantity) {
        CartDetail cd = this.cartDetailRepository.findById(cartDetailId).orElse(null);
        if (cd != null) {
            cd.setQuantity(quantity);
            this.cartDetailRepository.save(cd);
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone, String notes) {

        // fetch fresh user
        user = this.userService.getUserById(user.getId());

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setNotes(notes);
                order.setStatus("PENDING");

                double totalPrice = 0;
                for (CartDetail cd : cartDetails) {
                    totalPrice += cd.getPrice() * cd.getQuantity();
                }
                order.setTotalPrice(totalPrice);
                order = this.orderRepository.save(order);

                // create order detail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                // clear cart from user
                user.setCart(null);
                this.cartRepository.deleteById(cart.getId());

                // step 3: update session
                session.setAttribute("sum", 0);
            }
        }
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            this.orderRepository.deleteById(id);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }
}
