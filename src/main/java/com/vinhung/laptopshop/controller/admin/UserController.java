package com.vinhung.laptopshop.controller.admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vinhung.laptopshop.domain.Role;
import com.vinhung.laptopshop.domain.User;
import com.vinhung.laptopshop.service.RoleService;
import com.vinhung.laptopshop.service.UploadFileService;
import com.vinhung.laptopshop.service.UserService;

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
            Model model, @ModelAttribute("newUser") User user,
            @RequestParam("file") MultipartFile file) {
        userService.save(user, file);
        return "redirect:/admin/user";
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("users", userService.getAllUser());
        return "admin/user/users";
    }
}
