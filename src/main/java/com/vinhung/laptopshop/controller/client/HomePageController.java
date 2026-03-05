package com.vinhung.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.vinhung.laptopshop.service.ProductService;

@Controller
public class HomePageController {

    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "client/homepage/home";
    }
}
