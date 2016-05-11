package com.factorymanagement.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "Product")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@NotEmpty
	@Column(name = "REF_PRODUCT", nullable = false)
	private String refProduct;
	@NotEmpty
	@Column(name = "NAME_PRODUCT", nullable = false)
	private String nameProduct;

	@NotEmpty
	@Column(name = "PRICE_PRODUCT", nullable = false)
	private String priceProduct;

	@NotEmpty
	@Column(name = "CATEGORY", nullable = false)
	private String category;
	@NotEmpty
	@Column(name = "Product_Duration", nullable = false)
	private String productDuration;	
	@Override
	public String toString() {
		return "User [id=" + id + ",refProduct=" + refProduct + ", nameProduct=" + nameProduct + ", priceProduct="
				+ priceProduct + ",category=" + category + " ,productDuration="+ productDuration+"]";
	}

	public String getProductDuration() {
		return productDuration;
	}

	public void setProductDuration(String productDuration) {
		this.productDuration = productDuration;
	}

	public String getRefProduct() {
		return refProduct;
	}

	public void setRefProduct(String refProduct) {
		this.refProduct = refProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public String getPriceProduct() {
		return priceProduct;
	}

	public void setPriceProduct(String priceProduct) {
		this.priceProduct = priceProduct;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
