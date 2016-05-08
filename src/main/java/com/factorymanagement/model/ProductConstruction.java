
package com.factorymanagement.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class ProductConstruction implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@javax.persistence.Id
	private long Id;
	
	@OneToOne
	private Product relatedProduct;
	private TimeEntity timeEntity;

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public Product getRelatedProduct() {
		return relatedProduct;
	}

	public void setRelatedProduct(Product relatedProduct) {
		this.relatedProduct = relatedProduct;
	}

	public TimeEntity getTimeEntity() {
		return timeEntity;
	}

	public void setTimeEntity(TimeEntity timeEntity) {
		this.timeEntity = timeEntity;
	}

}
