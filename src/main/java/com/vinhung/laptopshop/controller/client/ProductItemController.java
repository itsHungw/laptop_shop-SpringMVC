package com.vinhung.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductItemController {

    @GetMapping("/product/{id}")
    public String getProductItem(@PathVariable Long id) {
        return "client/product/detail";
    }
}
