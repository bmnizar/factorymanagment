package com.factorymanagement.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.lang3.RandomUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.SessionImpl;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.factorymanagement.model.Product;
import com.factorymanagement.model.ProductConstruction;

@Repository
@Transactional
public class ProductConstructionOperationDAO {
	@PersistenceContext(unitName = "jpa-directory")
	private EntityManager em;

	@Transactional(propagation = Propagation.REQUIRED)
	public void saveProductConstruction(ProductConstruction productConstruction) {

		ProductConstruction merge = em.merge(productConstruction);
		System.out.println(" merged ");
		em.persist(merge);

		System.out.println("");
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteProductConstruction(ProductConstruction productConstruction) {

		ProductConstruction merge = em.merge(productConstruction);
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
	public List<ProductConstruction> getAllProductConstruction() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(ProductConstruction.class);
		List list = createCriteria.list();
		return list;

	}

	/**
	 * @param product
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<ProductConstruction> findRelatedProductConstructions(Product product) {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(ProductConstruction.class);
		createCriteria.add(Restrictions.eq("relatedProduct.nameProduct", product.getNameProduct()));
		List<ProductConstruction> list = createCriteria.list();
		return list;
	}

	/**
	 * @param productName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ProductConstruction> findRelatedProductConstructionsByName(String productName) {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(ProductConstruction.class).createAlias("relatedProduct", "rp");
		createCriteria.add(Restrictions.eq("rp.nameProduct", productName));
		List<ProductConstruction> list = createCriteria.list();
		return list;
	}

	/**
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	public List<Product> getAllProductsHavingAtLeastOneProductConstruction() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		Query createQuery = session.createQuery(
				"select p from Product p where p.id in(select pc.relatedProduct.id from ProductConstruction pc)");
		List list2 = createQuery.list();  

		return list2;  
	}

}
