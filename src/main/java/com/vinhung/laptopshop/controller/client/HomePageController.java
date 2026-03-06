package com.vinhung.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.vinhung.laptopshop.domain.dto.RegisterDto;
import com.vinhung.laptopshop.service.ProductService;
import com.vinhung.laptopshop.service.UserService;

import jakarta.validation.Valid;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;

    public HomePageController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "client/homepage/home";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("registerDto", new RegisterDto());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("registerDto") @Valid RegisterDto registerDto,
            BindingResult bindingResult) {

        // Validate password match
        if (!registerDto.getPassword().equals(registerDto.getConfirmPassword())) {
            bindingResult.addError(new FieldError("registerDto", "confirmPassword", "Mật khẩu không khớp"));
        }

        // Check if email exist
        if (this.userService.checkEmailExist(registerDto.getEmail())) {
            bindingResult.addError(new FieldError("registerDto", "email", "Email đã tồn tại"));
        }

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        this.userService.UserDtoRegister(registerDto);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        // model.addAttribute("loginUserDto", new LoginUserDto());
        return "client/auth/login";
    }

    @GetMapping("/access-denied")
    public String accessDenied(Model model) {
        return "client/auth/access-denied";
    }
}
