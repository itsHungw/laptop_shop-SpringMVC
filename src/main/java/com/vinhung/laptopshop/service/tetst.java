package com.vinhung.laptopshop.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class tetst {

    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().encode("1"));
    }

}
