
package com.factorymanagement.restfulwebservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.factorymanagement.dao.CommandDAO;
import com.factorymanagement.dao.ProductConstructionOperationDAO;
import com.factorymanagement.dao.ProductOperationDAO;

@RestController
public class CommandRestService {
	@Autowired
	ProductConstructionOperationDAO productConstructionOperationDAO;
	@Autowired
	ProductOperationDAO productOperation;
	
	@Autowired
	CommandDAO commandDAO;
}
