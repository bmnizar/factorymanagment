
package com.factorymanagement.restfulwebservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.factorymanagement.dao.ProductConstructionOperationDAO;
import com.factorymanagement.dao.ProductOperation;
import com.factorymanagement.model.Product;
import com.factorymanagement.model.User;

@RestController
public class ProductConstructionCalculationRestfulService {
	@Autowired
	ProductConstructionOperationDAO productConstructionOperationDAO;
	@Autowired
	ProductOperation productOperation;

	@RequestMapping(value = "/calculateProductConstructionTime/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<Void> calculateProductConstructionTime(@RequestBody Product user, UriComponentsBuilder ucBuilder) {
	
		// User user = new User();
//		userOperation.saveUser(user);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/calculateProductConstructionTime/{user}").buildAndExpand(user.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}
}
