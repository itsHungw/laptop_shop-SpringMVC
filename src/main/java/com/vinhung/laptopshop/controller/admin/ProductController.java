package com.vinhung.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vinhung.laptopshop.domain.Product;
import com.vinhung.laptopshop.service.ProductService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin/product")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("imageFile") MultipartFile imageFile) {
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        this.productService.save(newProduct, imageFile);
        return "redirect:/admin/product";
    }

    @GetMapping("/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable Long id) {
        model.addAttribute("product", this.productService.getProductById(id));
        return "admin/product/update";
    }

    @PostMapping("/update")
    public String updateProduct(@ModelAttribute("product") Product product,
            @RequestParam("imageFile") MultipartFile imageFile) {
        this.productService.updateProduct(product, imageFile);
        return "redirect:/admin/product";
    }

    @GetMapping("/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable Long id) {
        model.addAttribute("product", this.productService.getProductById(id));
        return "admin/product/delete";
    }

    @PostMapping("/delete")
    public String deleteProduct(@ModelAttribute("product") Product product) {
        this.productService.deleteProduct(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/{id}")
    public String getProductDetailPage(Model model, @PathVariable Long id) {
        model.addAttribute("product", this.productService.getProductById(id));
        return "admin/product/detail";
    }

    @GetMapping
    public String getProductsPage(Model model) {
        model.addAttribute("products", this.productService.getAllProducts());
        return "admin/product/product";
    }
}
