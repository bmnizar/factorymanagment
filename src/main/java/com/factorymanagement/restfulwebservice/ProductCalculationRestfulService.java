
package com.factorymanagement.restfulwebservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.factorymanagement.dao.ProductOperationDAO;
import com.factorymanagement.model.Product;
import com.factorymanagement.model.TimeEntity;
import com.factorymanagement.util.TimeEntityHelper;

@RestController
public class ProductCalculationRestfulService {
	@Autowired
	ProductOperationDAO productOperationDAO;


	@RequestMapping(value = "/fetchRelatedProducts/", method = RequestMethod.GET)
	public ResponseEntity<List<Product>> getRelatedProducts() {
		List<Product> listProducts = productOperationDAO
				.getAllProductsHavingAtLeastOneProduct();

		if (listProducts.isEmpty()) {
			return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);

		}
		return new ResponseEntity<List<Product>>(listProducts, HttpStatus.OK);
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/calculateProductTime/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<String> calculateProductTime(@RequestBody Object[] objects,
			UriComponentsBuilder ucBuilder) {
		String productName = (String) objects[0];
		String numberOfQuantity = (String) objects[1];
		List<Product> listProduct = productOperationDAO
				.findRelatedProductByName(productName);
		Product product = listProduct.get(0);
		String productDuration = product.getProductDuration();
		TimeEntity timeEntity = TimeEntityHelper.convertToTimeEntity(productDuration);
		TimeEntity resultTimeEntity = TimeEntityHelper.multiplyByNumberOfQuantity(timeEntity,
				Integer.valueOf(numberOfQuantity));
		String string = resultTimeEntity.toString();
		return new ResponseEntity<String>(string, HttpStatus.OK);

	}
}
