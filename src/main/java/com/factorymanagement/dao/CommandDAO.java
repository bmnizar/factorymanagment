
package com.factorymanagement.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.internal.SessionImpl;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.factorymanagement.model.Commande;
import com.factorymanagement.model.ProductConstruction;

@Repository
@Transactional
public class CommandDAO {
	@PersistenceContext(unitName = "jpa-directory")
	private EntityManager em;
	public SessionImpl getSessionImpl() {
		SessionImpl session = (SessionImpl) em.getDelegate();
		if (session.isClosed()) {

		}
		return session;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Commande> fetchAllCommands() {

		SessionImpl session = (SessionImpl) em.getDelegate();
		Criteria createCriteria = session.createCriteria(Commande.class);
		List list = createCriteria.list();
		return list;
	}
}
