package com.factorymanagement.dao;
import java.util.HashSet;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.internal.SessionImpl;
import org.hibernate.jpa.internal.EntityManagerImpl;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.factorymanagement.model.User;
import com.factorymanagement.model.UserInscription;

@Repository
@Transactional
public class UserOperation {
	@PersistenceContext(unitName = "jpa-directory")
	private EntityManager em;

	@Transactional(propagation = Propagation.REQUIRED)
	public void saveUser(User user) {
		Long nextLong = RandomUtils.nextLong(0, 10000L);
		// user.setId(nextLong.intValue());
		User merge = em.merge(user);
		System.out.println(" merged "); 
		em.persist(merge); 

		System.out.println("");
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteUser(User user) {
		Long nextLong = RandomUtils.nextLong(0, 10000L);
		// user.setId(nextLong.intValue());
		User merge = em.merge(user);
		System.out.println(" merged ");
		em.remove(merge);

		System.out.println("");
	}

	/**
	 * @param user
	 * @return
	 */
	private HashSet<UserInscription> createUserInscription(User user) {
		HashSet<UserInscription> userInscription = new HashSet<>();
		for (Integer i = 0; i < 5; i++) {

			UserInscription userInsc = new UserInscription();
			userInsc.setUser(user);
			userInsc.setDescription(RandomStringUtils.randomAlphabetic(52));
			userInsc.setName(i.toString());
			userInsc.setType("abc");
			userInscription.add(userInsc);
		}
		return userInscription;
	}

	public SessionImpl getSessionImpl() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		if (session.isClosed()) {

		}
		return session;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Transactional(readOnly = true)
	public List<User> getAllUsers() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(User.class);
		List list = createCriteria.list();
		return list;

	}
}
