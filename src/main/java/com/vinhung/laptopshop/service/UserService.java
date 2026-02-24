package com.vinhung.laptopshop.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vinhung.laptopshop.domain.Role;
import com.vinhung.laptopshop.domain.User;
import com.vinhung.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final UploadFileService uploadFileService;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;

    public UserService(UserRepository userRepository, UploadFileService uploadFileService,
            PasswordEncoder passwordEncoder, RoleService roleService) {
        this.userRepository = userRepository;
        this.uploadFileService = uploadFileService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public User save(User user, MultipartFile file) {
        String avatar = this.uploadFileService.uploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        Role role = this.roleService.getRoleByName(user.getRole().getName());
        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(role);
        return this.userRepository.save(user);
    }

    public User getUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public void deleteUser(Long id) {
        this.userRepository.deleteById(id);
    }

    public User updateUser(User user, MultipartFile file) {
        User user2 = this.getUserById(user.getId());
        if (user2 != null) {
            String avatar = this.uploadFileService.uploadFile(file, "avatar");
            Role role = this.roleService.getRoleByName(user.getRole().getName());
            user2.setFullName(user.getFullName());
            // user2.setEmail(user.getEmail());
            user2.setPhone(user.getPhone());
            user2.setAddress(user.getAddress());
            user2.setRole(role);
            if (file != null && !file.isEmpty()) {
                user2.setAvatar(avatar);
            }

            return this.userRepository.save(user2);
        }
        return null;
    }
}
