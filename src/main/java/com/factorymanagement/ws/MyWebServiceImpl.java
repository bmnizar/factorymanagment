
package com.factorymanagement.ws;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

@WebService
public class MyWebServiceImpl {
	@WebMethod
	public @WebResult ResponseValue sum(@WebParam int a, @WebParam int b) {
		return new ResponseValue(a, b);
	}

}
