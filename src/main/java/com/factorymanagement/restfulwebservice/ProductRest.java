package com.factorymanagement.restfulwebservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.factorymanagement.appConfig.ApplicationRole;
import com.factorymanagement.dao.ProductConstructionOperationDAO;
import com.factorymanagement.dao.ProductOperation;
import com.factorymanagement.dao.ProductOperationDAO;
import com.factorymanagement.model.Product;
import com.factorymanagement.model.ProductConstruction;
import com.factorymanagement.model.User;

@RestController
public class ProductRest {

	@Autowired
	ProductOperationDAO productOperationDAO;

	@RequestMapping(value = "/allProducts/", method = RequestMethod.GET)
	public ResponseEntity<List<Product>> listAllProducts() {
		List<Product> listProduct = productOperationDAO.getAllProducts();

		if (listProduct.isEmpty()) {
			return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);

		}
		return new ResponseEntity<List<Product>>(listProduct, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateProduct/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> updateProduct(@RequestBody Product product, UriComponentsBuilder ucBuilder) {
		System.out.println("Updating product ");

		productOperationDAO.saveProduct(product);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/updateProduct/{product}").buildAndExpand(product.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/createProduct/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> createProduct(@RequestBody Product product, UriComponentsBuilder ucBuilder) {
		System.out.println("Creating product ");

		productOperationDAO.saveProduct(product);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/createProduct/{product}").buildAndExpand(product.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/deleteProduct/", method = RequestMethod.DELETE, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Product> deleteProduct(@RequestBody Product product) {
		System.out.println("Deleting product ");

		productOperationDAO.deleteProduct(product);

		return new ResponseEntity<Product>(HttpStatus.NO_CONTENT);

	}

}