package com.vinhung.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String index() {
        return "admin/dashboard/dashboard";
    }

    @GetMapping("/admin/order")
    public String order() {
        return "admin/order/order";
    }

}
