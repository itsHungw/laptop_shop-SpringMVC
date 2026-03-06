package com.vinhung.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vinhung.laptopshop.domain.Cart;
import com.vinhung.laptopshop.domain.CartDetail;
import com.vinhung.laptopshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);
}
