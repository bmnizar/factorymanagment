package com.factorymanagement.appConfig;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.nuxeo.client.api.NuxeoClient;
import org.nuxeo.client.api.objects.Document;
import org.nuxeo.client.api.objects.blob.Blob;
import org.nuxeo.client.api.objects.blob.Blobs;
import org.nuxeo.client.api.objects.directory.Directory;
import org.nuxeo.client.api.objects.directory.DirectoryManager;
import org.nuxeo.client.api.objects.upload.BatchFile;
import org.nuxeo.client.api.objects.upload.BatchUpload;
import org.nuxeo.client.api.objects.user.CurrentUser;

import net.sf.json.JSONObject;
import okhttp3.Response;

public class TestNuxeo {

	@SuppressWarnings("unused")
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		String url = "http://localhost:8080/nuxeo";
		NuxeoClient nuxeoClient = new NuxeoClient(url, "Administrator", "Administrator");
		nuxeoClient = nuxeoClient.timeout(60).transactionTimeout(60);
		Document root = nuxeoClient.repository().fetchDocumentRoot();
		root = nuxeoClient.repository().fetchDocumentRoot();
		CurrentUser currentUser = nuxeoClient.fetchCurrentUser();
		System.out.println(currentUser.getFirstName());
		DirectoryManager directoryManager = nuxeoClient.getDirectoryManager();
		Response response = nuxeoClient.get(
				"http://localhost:8080/nuxeo/site/api/v1/query?query=select * from Document where dc:title like 'rafikDocuemnt' ");

		String json = response.body().string();
		Document document = (Document) nuxeoClient.getConverterFactory().readJSON(json, Document.class);

		BatchUpload batchUpload = nuxeoClient.fetchUploadManager();

		File file = new File("D:\\Work\\factorymanagment\\trunk\\src\\main\\webapp\\scripts\\user_service.js");
		boolean exists = file.exists();
		batchUpload = batchUpload.upload(file.getName(), file.length(), "js", batchUpload.getBatchId(), "1", file);
		String batchId = batchUpload.getBatchId();
		// Fetch this file
		BatchFile batchFile = batchUpload.fetchBatchFile("1");
		long size = batchFile.getSize();
		System.out.println(size);
		Response responseUpload = nuxeoClient.get("http://localhost:8080/nuxeo/site/api/v1/upload/" + batchId);
		System.out.println(responseUpload.isSuccessful());

		JSONObject mainouterObject = new JSONObject();
		mainouterObject.put("entity-type", "document");
		mainouterObject.put("name", "rafikDocument alf marra ");
		mainouterObject.put("type", "File");

		JSONObject propertiesObject = new JSONObject();
		propertiesObject.put("dc:title", "mani 9otlik rafikdocument alf marra");
	
		JSONObject fileContenantObject = new JSONObject();
		fileContenantObject.put("upload-batch", batchId);
		fileContenantObject.put("upload-fileId", "1");
		propertiesObject.put("file:content", fileContenantObject);
		mainouterObject.put("properties", propertiesObject);
		String jsonUpload = mainouterObject.toString();
//		String jsonUpload = FileUtils.readFileToString(new File("D:\\abc.xml"));
		jsonUpload = jsonUpload.replace("mybatchid", batchId);
		Response post = nuxeoClient.post("http://localhost:8080/nuxeo/api/v1/path/default-domain/workspaces/Ws1",
				jsonUpload);
		System.out.println(jsonUpload+"  \n "+post.isSuccessful());
		// Blob fileBlob = new Blob(file);
		// Blob blob =
		// nuxeoClient.automation().newRequest("Blob.AttachOnDocument").param("document",
		// "/default-domain/workspaces")
		// .input(fileBlob).execute();
		//
		// Blobs inputBlobs = new Blobs();
		// inputBlobs.add(file);
		//
		// Blobs blobs =
		// nuxeoClient.automation().newRequest("Blob.AttachOnDocument").param("xpath",
		// "files:files")
		// .param("document", "/folder/file").input(inputBlobs).execute();
		//
		// Blob resultBlob =
		// nuxeoClient.automation().input("folder/file").execute("Document.GetBlob");

		System.exit(5);

		// Blob fetchBlob = document.get
		Directory directory = nuxeoClient.getDirectoryManager().fetchDirectory("workspaces");

		System.out.println(root);
		// Document folder =
		// nuxeoClient.repository().fetchDocumentByPath("/folder_2");
	}

}
