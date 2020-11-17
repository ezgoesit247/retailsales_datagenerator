package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the Sales database table.
 * 
 */
@Entity
@Table(name="Sales")
@NamedQuery(name="Sale.findAll", query="SELECT s FROM Sale s")
public class Sale implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private SalePK id;

	private int quantity;

	@Temporal(TemporalType.TIMESTAMP)
	private Date transactionDate;

	private BigDecimal unitPrice;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="CustomerKey")
	private Customer dimCustomer;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="ProductKey")
	private Product dimProduct;

	public Sale() {
	}

	public SalePK getId() {
		return this.id;
	}

	public void setId(SalePK id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getTransactionDate() {
		return this.transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public BigDecimal getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Customer getDimCustomer() {
		return this.dimCustomer;
	}

	public void setDimCustomer(Customer dimCustomer) {
		this.dimCustomer = dimCustomer;
	}

	public Product getDimProduct() {
		return this.dimProduct;
	}

	public void setDimProduct(Product dimProduct) {
		this.dimProduct = dimProduct;
	}

}