package com.factorymanagement.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "Commande")
public class Commande implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@NotEmpty
	@Column(name = "REF_COMMANDE", nullable = false)
	private String refCommande;
	@NotEmpty
	@Column(name = "DATE_OF_RECEIPT", nullable = false)
	private Date dateOfReceipt;
	@Column(name = "DELIVERY_DATE", nullable = false)
	private Date deliveryDate;

	@Column(name = "AMOUNT_Of_PRODUCT", nullable = false)
	private String amountOfProduct;
	@NotEmpty
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "COMMANDE_PRODUCT", joinColumns = { @JoinColumn(name = "COMMANDE_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "PRODUCT_ID") })
	private Set<Product> listProduct = new HashSet<Product>();
	@Column(name = "COMMANDE_TYPE", nullable = false)
	private CommandeType commandeType;

	public String getRefCommande() {
		return refCommande;
	}

	public void setRefCommande(String refCommande) {
		this.refCommande = refCommande;
	}

	public Date getDateOfReceipt() {
		return dateOfReceipt;
	}

	public void setDateOfReceipt(Date dateOfReceipt) {
		this.dateOfReceipt = dateOfReceipt;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getAmountOfProduct() {
		return amountOfProduct;
	}

	public void setAmountOfProduct(String amountOfProduct) {
		this.amountOfProduct = amountOfProduct;
	}

	public Set<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(Set<Product> listProduct) {
		this.listProduct = listProduct;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ",refCommande=" + refCommande + ", dateOfReceipt=" + dateOfReceipt + ", deliveryDate="
				+ deliveryDate + ",amountOfProduct=" + amountOfProduct + ",commandeType=" + commandeType + "]";
	}

}
