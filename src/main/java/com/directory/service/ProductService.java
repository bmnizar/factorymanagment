package com.directory.service;
import java.util.List;
import com.directory.model.Product;

public interface ProductService {
	Product findById(long id);
    
    Product findByName(String name);
     
    void saveProduct(Product product);
     
    void updateProduct(Product product);
     
    void deleteProductById(long id);
 
    List<Product> findAllProduct(); 
     
    void deleteAllProduct();
     
    public boolean isproductExist(Product product);

}