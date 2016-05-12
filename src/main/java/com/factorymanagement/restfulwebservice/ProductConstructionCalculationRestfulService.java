
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

import com.factorymanagement.dao.ProductConstructionOperationDAO;
import com.factorymanagement.dao.ProductOperationDAO;
import com.factorymanagement.model.Product;
import com.factorymanagement.model.ProductConstruction;
import com.factorymanagement.model.TimeEntity;
import com.factorymanagement.util.TimeEntityHelper;

@RestController
public class ProductConstructionCalculationRestfulService {
	@Autowired
	ProductConstructionOperationDAO productConstructionOperationDAO;
	@Autowired
	ProductOperationDAO productOperation;

	@RequestMapping(value = "/fetchRelatedProducts/", method = RequestMethod.GET)
	public ResponseEntity<List<Product>> getRelatedProducts() {
		List<Product> listProducts = productConstructionOperationDAO
				.getAllProductsHavingAtLeastOneProductConstruction();

		if (listProducts.isEmpty()) {
			return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);

		}
		return new ResponseEntity<List<Product>>(listProducts, HttpStatus.OK);
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/calculateProductConstructionTime/", method = RequestMethod.POST, consumes = {
			"application/json;charset=UTF-8;text/html" })
	public ResponseEntity<String> calculateProductConstructionTime(@RequestBody Object[] objects,
			UriComponentsBuilder ucBuilder) {
		String productName = (String) objects[0];
		String numberOfQuantity = (String) objects[1];
		List<ProductConstruction> listProductConstructions = productConstructionOperationDAO
				.findRelatedProductConstructionsByName(productName);
		ProductConstruction productConstruction = listProductConstructions.get(0);
		String productDuration = productConstruction.getProductDuration();
		TimeEntity timeEntity = TimeEntityHelper.convertToTimeEntity(productDuration);
		TimeEntity resultTimeEntity = TimeEntityHelper.multiplyByNumberOfQuantity(timeEntity,
				Integer.valueOf(numberOfQuantity));
		String string = resultTimeEntity.toString();
		return new ResponseEntity<String>(string, HttpStatus.OK);

	}
}
