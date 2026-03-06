package com.vinhung.laptopshop.repository;

import org.springframework.stereotype.Repository;
import com.vinhung.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User save(User user);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}
