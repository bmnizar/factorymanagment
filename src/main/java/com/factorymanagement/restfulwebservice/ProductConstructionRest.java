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
import com.factorymanagement.model.Product;
import com.factorymanagement.model.ProductConstruction;
import com.factorymanagement.model.User;

@RestController
public class ProductConstructionRest {

	@Autowired
	ProductConstructionOperationDAO productConstructionOperationDAO;
	@Autowired
	ProductOperation productOperation;

	@RequestMapping(value = "/allProductConstruction/", method = RequestMethod.GET)
	public ResponseEntity<List<ProductConstruction>> getAllProductConstructions() {
		List<ProductConstruction> listProductConstruction = productConstructionOperationDAO.getAllProductConstruction();
		for (ProductConstruction productConstruction : listProductConstruction) {
			String relatedProductName = productConstruction.getRelatedProductName();
			productConstruction.setRelatedProductName(relatedProductName);
		}
		if (listProductConstruction.isEmpty()) {
			return new ResponseEntity<List<ProductConstruction>>(HttpStatus.NO_CONTENT);

		}
		return new ResponseEntity<List<ProductConstruction>>(listProductConstruction, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateProductConstruction/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> updateProductConstruction(@RequestBody ProductConstruction productConstruction,
			UriComponentsBuilder ucBuilder) {
		System.out.println("Updating productConstruction ");
	
		String relatedProductName = productConstruction.getRelatedProductName();
		Product relatedProduct = productOperation.findProductByName(relatedProductName);
		productConstruction.setRelatedProduct(relatedProduct);
		productConstructionOperationDAO.saveProductConstruction(productConstruction);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/updateProductConstruction/{productConstruction}")
				.buildAndExpand(productConstruction.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/createProductConstruction/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> createProductConstruction(@RequestBody ProductConstruction productConstruction,
			UriComponentsBuilder ucBuilder) {
		System.out.println("Creating productConstruction ");
		// User user = new User();
		String relatedProductName = productConstruction.getRelatedProductName();
		Product relatedProduct = productOperation.findProductByName(relatedProductName);
		productConstruction.setRelatedProduct(relatedProduct);
		productConstructionOperationDAO.saveProductConstruction(productConstruction);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/createProductConstruction/{productConstruction}")
				.buildAndExpand(productConstruction.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/deleteProductConstruction/", method = RequestMethod.DELETE, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<User> deleteUser(@RequestBody ProductConstruction productConstruction) {
		System.out.println("Deleting productConstruction ");
		String relatedProductName = productConstruction.getRelatedProductName();
		Product relatedProduct = productOperation.findProductByName(relatedProductName);
		productConstruction.setRelatedProduct(relatedProduct);
		productConstructionOperationDAO.deleteProductConstruction(productConstruction);

		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);

	}

}