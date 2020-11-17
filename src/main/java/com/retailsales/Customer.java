package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DimCustomer database table.
 * 
 */
@Entity
@Table(name="DimCustomer")
@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int customerKey;

	private String firstName;

	private String lastName;

	//bi-directional many-to-one association to Geography
	@ManyToOne
	@JoinColumn(name="GeographyKey")
	private Geography dimGeography;

	//bi-directional many-to-one association to Sale
	@OneToMany(mappedBy="dimCustomer")
	private List<Sale> sales;

	public Customer() {
	}

	public int getCustomerKey() {
		return this.customerKey;
	}

	public void setCustomerKey(int customerKey) {
		this.customerKey = customerKey;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Geography getDimGeography() {
		return this.dimGeography;
	}

	public void setDimGeography(Geography dimGeography) {
		this.dimGeography = dimGeography;
	}

	public List<Sale> getSales() {
		return this.sales;
	}

	public void setSales(List<Sale> sales) {
		this.sales = sales;
	}

	public Sale addSale(Sale sale) {
		getSales().add(sale);
		sale.setDimCustomer(this);

		return sale;
	}

	public Sale removeSale(Sale sale) {
		getSales().remove(sale);
		sale.setDimCustomer(null);

		return sale;
	}

}