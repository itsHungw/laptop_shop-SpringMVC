package com.vinhung.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

        @Bean
        public ViewResolver viewResolver() {
                InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
                // Sets the directory where view files are located
                viewResolver.setPrefix("/WEB-INF/view/");
                // Sets the file extension for view files
                viewResolver.setSuffix(".jsp");
                return viewResolver;
        }

        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("/css/**")
                                .addResourceLocations("/resources/css/");
                registry.addResourceHandler("/js/**")
                                .addResourceLocations("/resources/js/");
                registry.addResourceHandler("/images/**")
                                .addResourceLocations("/resources/images/");
                registry.addResourceHandler("/client/**")
                                .addResourceLocations("/resources/client/");
        }
}
