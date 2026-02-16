package com.vinhung.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vinhung.laptopshop.domain.User;
import com.vinhung.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public User save(User user) {

        return this.userRepository.save(user);
    }

    public User getUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public void deleteUser(Long id) {
        this.userRepository.deleteById(id);
    }

    public User updateUser(User user) {
        User user2 = this.getUserById(user.getId());
        if (user2 != null) {
            user2.setFullName(user.getFullName());
            // user2.setEmail(user.getEmail());
            user2.setPhone(user.getPhone());
            user2.setAddress(user.getAddress());
            return this.userRepository.save(user2);
        }
        return null;
    }
}
