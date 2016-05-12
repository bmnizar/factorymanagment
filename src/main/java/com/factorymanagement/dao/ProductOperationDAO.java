package com.factorymanagement.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.SessionImpl;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.factorymanagement.model.Product;

@Repository
@Transactional
public class ProductOperationDAO {
	@PersistenceContext(unitName = "jpa-directory")
	private EntityManager em;

	@Transactional(propagation = Propagation.REQUIRED)
	public void saveProduct(Product product) {

		Product merge = em.merge(product);
		System.out.println(" merged ");
		em.persist(merge);

		System.out.println("");
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteProduct(Product product) {

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

	/**
	 * El mochkla fel partir hathiiii mafhemtech kiffech ne5demhaa
	 */

	@SuppressWarnings("unchecked")
	public Product findRelatedProductByName(String productName) {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(Product.class);
		createCriteria.add(Restrictions.eq("nameProduct", productName));
		List<Product> list = createCriteria.list();
		return list.get(0);
	}

	/**
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	public List<Product> getAllProductsHavingAtLeastOneProduct() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Query createQuery = session.createQuery(
				"select p from Product p where p.id in(select pc.relatedProduct.id from ProductConstruction pc)");
		List list2 = createQuery.list();

		return list2;
	}

}
