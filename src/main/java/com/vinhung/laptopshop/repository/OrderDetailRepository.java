package com.vinhung.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.vinhung.laptopshop.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
