package com.vinhung.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.vinhung.laptopshop.service.ProductService;

@Controller
public class ProductItemController {

    private final ProductService productService;

    public ProductItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductItem(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "client/product/detail";
    }

}
