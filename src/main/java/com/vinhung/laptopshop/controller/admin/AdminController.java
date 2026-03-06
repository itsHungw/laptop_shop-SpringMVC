package com.vinhung.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.vinhung.laptopshop.repository.OrderRepository;
import com.vinhung.laptopshop.repository.ProductRepository;
import com.vinhung.laptopshop.service.UserService;

@Controller
public class AdminController {

    private final UserService userService;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public AdminController(UserService userService, OrderRepository orderRepository,
            ProductRepository productRepository) {
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/admin")
    public String index(Model model) {
        model.addAttribute("totalUser", this.userService.getAllUser().size());
        model.addAttribute("totalOrder", this.orderRepository.count());
        model.addAttribute("totalProduct", this.productRepository.count());
        return "admin/dashboard/dashboard";
    }

}
