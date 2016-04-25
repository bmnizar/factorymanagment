
package com.directory.unitTesting;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.directory.controller.UserOperation;
import com.directory.model.User;

import mockit.Expectations;
import mockit.Mocked;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:D:\\Work\\worknouha\\my_devs_projects\\myDirectory\\WebContent\\WEB-INF\\crunchify-servlet.xml" })
@WebAppConfiguration
public class TestUserOperationWithoutMocking {
	@Autowired
	UserOperation userOperation;

	@Test
	public void testSaveUser() {
		User  user = new User();
		user.setFirstName("xasxa");
		user.setLastName("dasdas");
		user.setEmail("dasdas@dsad.ds");
		userOperation.saveUser(user);
	}

	@Test
	public void testfindAllUsers() {
		List<User> allUsers = userOperation.getAllUsers();
		for (User user : allUsers) {
			System.out.println("user email " + user.getEmail());
		}
	}

//	private List<User> getMockedListOfUsers() {
//		List<User> listOfUsers = new ArrayList<User>();
//		User user1 = new User();
//
//		user1.setEmail("ali@yahoo.com");
//		user1.setFirstName("salah");
//		user1.setSsoId("5854854");
//		user1.setLastName("ben salah");
//		listOfUsers.add(user1);
//		User user2 = new User();
//
//		user2.setEmail("mohamed@yahoo.com");
//		user2.setFirstName("mohamed");
//		user2.setSsoId("985415785");
//		user2.setLastName("ben ammar");
//		listOfUsers.add(user2);
//		return listOfUsers;
//	}
}
