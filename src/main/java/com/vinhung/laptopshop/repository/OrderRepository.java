package com.vinhung.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.vinhung.laptopshop.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
