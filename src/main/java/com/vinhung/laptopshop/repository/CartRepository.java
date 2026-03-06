package com.vinhung.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vinhung.laptopshop.domain.Cart;
import com.vinhung.laptopshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
