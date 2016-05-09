
package com.factorymanagement.unitTesting;

import java.util.List;

import javax.xml.ws.Endpoint;
import javax.xml.ws.handler.Handler;

import com.factorymanagement.ws.MyWebServiceImpl;
import com.factorymanagement.ws.SOAPLoggingHandler;

/**
 * @author BMN(BM.NIZAR) s71055
 */
/**
 * @author s715055
 *
 */
public class TestingWs {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 Endpoint publish = Endpoint.publish("http://localhost:9999/ws/hello", new MyWebServiceImpl());
		 List<Handler> handlerChain = publish.getBinding().getHandlerChain();
		 handlerChain.add(new SOAPLoggingHandler());
		 publish.getBinding().setHandlerChain(handlerChain);

	}

}
