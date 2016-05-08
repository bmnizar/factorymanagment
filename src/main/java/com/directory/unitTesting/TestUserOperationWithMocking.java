
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
import com.factorymanagement.model.User;

import mockit.Expectations;
import mockit.Mocked;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations = {
		"file:D:\\Work\\worknouha\\my_devs_projects\\myDirectory\\WebContent\\WEB-INF\\crunchify-servlet.xml" })
@WebAppConfiguration
public class TestUserOperationWithMocking {

	@Mocked
	UserOperation userOperationMocked = null;

	@Test
	public void testfindAllUsers() {
		/**
		 * ici au lieu d aller au base de donnee pour voir reelement les lists
		 * des users on vas les mocker en disant que voici list des users que tu
		 * dois utiliser au lieu d aller au base de donnee reelement pour
		 * tester(base de donnee not ready pb in database ,too much time require
		 * to go to database thus unit testing will take too much time
		 */
		new Expectations() {
			{
				// "Database" is mocked strictly, therefore the order of these
				// invocations does matter:
//				List<User> mockedListOfUsers = getMockedListOfUsers();
//				userOperationMocked.getAllUsers();
//				result = mockedListOfUsers;

			}

		};
		List<User> allUsers = userOperationMocked.getAllUsers();
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
