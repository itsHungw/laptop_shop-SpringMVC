package com.vinhung.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vinhung.laptopshop.domain.Role;
import com.vinhung.laptopshop.repository.RoleRepository;

@Service
public class RoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public List<Role> getAllRole() {
        return this.roleRepository.findAll();
    }

    public Role getRoleById(Long id) {
        return this.roleRepository.findById(id).orElse(null);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name).orElse(null);
    }
}
