package com.vinhung.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vinhung.laptopshop.domain.Product;
import com.vinhung.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final UploadFileService uploadFileService;

    public ProductService(ProductRepository productRepository, UploadFileService uploadFileService) {
        this.productRepository = productRepository;
        this.uploadFileService = uploadFileService;
    }

    public Product save(Product product, MultipartFile file) {
        String image = this.uploadFileService.uploadFile(file, "product");
        product.setImage(image);
        return productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public Product updateProduct(Product product, MultipartFile file) {
        String image = this.uploadFileService.uploadFile(file, "product");
        product.setImage(image);
        return productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

}
