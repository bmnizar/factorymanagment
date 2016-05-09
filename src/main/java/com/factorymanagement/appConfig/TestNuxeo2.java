
package com.factorymanagement.appConfig;

import org.nuxeo.client.api.NuxeoClient;
import org.nuxeo.client.api.objects.Document;
import org.nuxeo.client.api.objects.blob.Blob;
import org.nuxeo.common.utils.FileUtils;

import okhttp3.Response;
public class TestNuxeo2 {

	/**
	 * @param args
	 * @throws Exception 
	 */
	@SuppressWarnings("unused")
	public static void main(String[] args) throws Exception {
		String url = "http://localhost:8080/nuxeo";
		NuxeoClient nuxeoClient = new NuxeoClient(url, "Administrator", "Administrator");
		nuxeoClient = nuxeoClient.timeout(19989).transactionTimeout(9989898);
		Document root = nuxeoClient.repository().fetchDocumentRoot();
		
		Document documentUpdated = nuxeoClient.repository().fetchDocumentByPath("/default-domain/workspaces/Ws1/abcabc");
		documentUpdated.setTitle("note zzzzzzzzzzzzzzzzz");
		documentUpdated.set("dc:nature", "Application");
		documentUpdated.set("dc:description", "xzxzzdvsgfbgfd");
		documentUpdated = nuxeoClient.repository().updateDocument(documentUpdated);
		String entityType = documentUpdated.getEntityType();
		String name = documentUpdated.getName();
		Blob fetchBlob = documentUpdated.fetchBlob();
		String readFile = FileUtils.readFile(fetchBlob.getFile());
	
		System.out.println(readFile);
		root = nuxeoClient.repository().fetchDocumentRoot();
		Response response = nuxeoClient.get(
				"http://localhost:8080/nuxeo/site/api/v1/query?query=select * from Document  where ecm:primaryType='File'  ");
		String json = response.body().string();
		System.out.println(json);

	}

}
