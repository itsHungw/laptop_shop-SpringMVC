package com.vinhung.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vinhung.laptopshop.domain.User;
import com.vinhung.laptopshop.service.RoleService;
import com.vinhung.laptopshop.service.UploadFileService;
import com.vinhung.laptopshop.service.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    private final UserService userService;
    private final RoleService roleService;
    private final UploadFileService uploadFileService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleService roleService, UploadFileService uploadFileService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadFileService = uploadFileService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/{id}")
    public String getUserById(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.getUserById(id));
        return "admin/user/detail";
    }

    @GetMapping("/update/{id}")
    public String update(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.getUserById(id));
        return "admin/user/update";
    }

    @PostMapping("/update")
    public String submitUpdate(Model model, @ModelAttribute("user") User user,
            @RequestParam("file") MultipartFile file) {
        userService.updateUser(user, file);
        return "redirect:/admin/user";
    }

    @GetMapping("/delete/{id}")
    public String viewDelete(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("deleteUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/delete")
    public String delete(Model model, @ModelAttribute("deleteUser") User deleteUser) {
        userService.deleteUser(deleteUser.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/create")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/create")
    public String submit(
            Model model, @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("file") MultipartFile file) {

        List<FieldError> fieldErrors = newUserBindingResult.getFieldErrors();
        for (FieldError fieldError : fieldErrors) {
            System.out.println(fieldError.getField() + " " + fieldError.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        userService.save(user, file);
        return "redirect:/admin/user";
    }

    @GetMapping
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") Optional<String> page) {
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
        Pageable pageable = PageRequest.of(pageInt - 1, 5);
        Page<User> pageUser = userService.getAllUser(pageable);
        List<User> users = pageUser.getContent();
        model.addAttribute("users", users);
        model.addAttribute("totalPages", pageUser.getTotalPages());
        model.addAttribute("currentPage", pageInt);
        return "admin/user/users";
    }
}
