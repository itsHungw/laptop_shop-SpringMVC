package com.vinhung.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;

import com.vinhung.laptopshop.domain.Order;
import com.vinhung.laptopshop.service.ProductService;

@Controller
public class OrderController {

    private final ProductService productService;

    public OrderController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model, @RequestParam("page") Optional<String> page) {
        int pageInt = 1;
        try {
            if (page.isPresent()) {
                pageInt = Integer.parseInt(page.get());
            } else {
                pageInt = 1;
            }
        } catch (Exception e) {
            pageInt = 1;
        }
        Pageable pageable = PageRequest.of(pageInt - 1, 3);
        Page<Order> pageOrder = this.productService.fetchAllOrders(pageable);
        List<Order> orders = pageOrder.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("totalPages", pageOrder.getTotalPages());
        model.addAttribute("currentPage", pageInt);
        return "admin/order/order";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Optional<Order> orderOptional = this.productService.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            model.addAttribute("order", order);
            model.addAttribute("id", id);
            model.addAttribute("orderDetails", order.getOrderDetails());
            return "admin/order/detail";
        }
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {
        this.productService.deleteOrderById(order.getId());
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Optional<Order> orderOptional = this.productService.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            model.addAttribute("newOrder", orderOptional.get());
            return "admin/order/update";
        }
        return "redirect:/admin/order";
    }

    @PostMapping("/admin/order/update")
    public String handleUpdateOrder(@ModelAttribute("newOrder") Order order) {
        this.productService.updateOrder(order);
        return "redirect:/admin/order";
    }
}
