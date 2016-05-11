
package com.factorymanagement.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
public class ProductConstruction implements Serializable {

	private static final long serialVersionUID = 1L;

	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long Id;
	@Transient
	@JsonSerialize
	@JsonDeserialize
	private String relatedProductName;
	@Transient
	@JsonSerialize
	@JsonDeserialize
	private String relatedProductReference;
	@JoinColumn(name="relatedProductId")
	@OneToOne()
	private Product relatedProduct;

	private String productDuration;

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

	public String getProductDuration() {
		return productDuration;
	}

	public void setProductDuration(String productDuration) {
		this.productDuration = productDuration;
	}

	public String getRelatedProductName() {
		return relatedProductName;
	}

	public void setRelatedProductName(String relatedProductName) {
		this.relatedProductName = relatedProductName;
	}

	public String getRelatedProductReference() {
		return relatedProductReference;
	}

	public void setRelatedProductReference(String relatedProductReference) {
		this.relatedProductReference = relatedProductReference;
	}

}
