package com.directory.controller;

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

import com.directory.appConfig.ApplicationRole;
import com.directory.model.Product;
import com.directory.model.User;

@RestController
public class MyDirectoryRestController {

	@Autowired
	UserOperation userOperation;
	@Autowired
	ProductOperation productOperation;
	// Service which will do all data
	// retrieval/manipulation work

	// -------------------Retrieve All
	// Users--------------------------------------------------------

	@RequestMapping(value = "/allUsers/", method = RequestMethod.GET)
	public ResponseEntity<List<User>> listAllUsers() {
		List<User> users = userOperation.getAllUsers();
		if (users.isEmpty()) {
			return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);

		}
		return new ResponseEntity<List<User>>(users, HttpStatus.OK);
	}

	@RequestMapping(value = "/allProducts/", method = RequestMethod.GET)
	public ResponseEntity<List<Product>> listAllProducts() {
		List<Product> products = productOperation.getAllProducts();
		if (products.isEmpty()) {
			return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);

		}
		return new ResponseEntity<List<Product>>(products, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateUser/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> updateUser(@RequestBody User user, UriComponentsBuilder ucBuilder) {
		System.out.println("Updating User " + user.getFirstName());
		// User user = new User();
		userOperation.saveUser(user);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/updateUser/{user}").buildAndExpand(user.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/createUser/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> createUser(@RequestBody User user, UriComponentsBuilder ucBuilder) {
		System.out.println("Creating User " + user.getFirstName());
		// User user = new User();
		userOperation.saveUser(user);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/createUser/{user}").buildAndExpand(user.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/saveProduct/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> saveProduct(@RequestBody Product product, UriComponentsBuilder ucBuilder) {
		System.out.println("Creating Product " + product.getNameProduct());
		// User user = new User();
		productOperation.saveProduct(product);  

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveProduct/{product}").buildAndExpand(product.getRefProduct()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	///////////////////////////// add enum Application Role///////////////
	/*
	 * @RequestMapping(value = "/new/actionStates", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public List<String> returnApplicationRole(){ return
	 * userOperation.enumToStringList(ApplicationRole.class); }
	 */
	@RequestMapping(value = "/deleteUser/", method = RequestMethod.DELETE, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<User> deleteUser(@RequestBody User user) {
		System.out.println("Deleting User " + user.getFirstName());
		// User user = new User();
		userOperation.deleteUser(user);

		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);

	}

	@RequestMapping(value = "/deleteProduct/", method = RequestMethod.DELETE, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Product> deleteProduct(@RequestBody Product product) {
		System.out.println("Deleting Product " + product.getNameProduct());
		// User user = new User();
		productOperation.deleteProduct(product);

		return new ResponseEntity<Product>(HttpStatus.NO_CONTENT);

	}
}