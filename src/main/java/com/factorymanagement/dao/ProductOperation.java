package com.factorymanagement.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.lang3.RandomUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.SessionImpl;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.factorymanagement.model.Product;

@Repository
@Transactional
public class ProductOperation {
	@PersistenceContext(unitName = "jpa-directory")
	private EntityManager em;

	@Transactional(propagation = Propagation.REQUIRED)
	public void saveProduct(Product product) {
		Long nextLong = RandomUtils.nextLong(0, 10000L);
		// user.setId(nextLong.intValue());
		Product merge = em.merge(product);
		System.out.println(" merged ");
		em.persist(merge);

		System.out.println("");
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteProduct(Product product) {
		Long nextLong = RandomUtils.nextLong(0, 10000L);
		// user.setId(nextLong.intValue());
		Product merge = em.merge(product);
		System.out.println(" merged ");
		em.remove(merge);

		System.out.println("");
	}

	/**
	 * @param user
	 * @return
	 */

	public SessionImpl getSessionImpl() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		if (session.isClosed()) {

		}
		return session;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Transactional(readOnly = true)
	public List<Product> getAllProducts() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(Product.class);
		List list = createCriteria.list();
		return list;

	}

	public Product findProductByName(String relatedProductName) {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(Product.class);
		Criteria add = createCriteria.add(Restrictions.eq("nameProduct", relatedProductName));
		List list = add.list();
		Product product = (Product) list.get(0);
		return product;

	}

}
