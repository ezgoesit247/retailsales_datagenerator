package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DimGeography database table.
 * 
 */
@Entity
@Table(name="DimGeography")
@NamedQuery(name="Geography.findAll", query="SELECT g FROM Geography g")
public class Geography implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int geographyKey;

	private String city;

	private String countryRegionCode;

	private String countryRegionName;

	private String postalCode;

	private String stateProvinceCode;

	private String stateProvinceName;

	//bi-directional many-to-one association to Customer
	@OneToMany(mappedBy="dimGeography")
	private List<Customer> dimCustomers;

	public Geography() {
	}

	public int getGeographyKey() {
		return this.geographyKey;
	}

	public void setGeographyKey(int geographyKey) {
		this.geographyKey = geographyKey;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountryRegionCode() {
		return this.countryRegionCode;
	}

	public void setCountryRegionCode(String countryRegionCode) {
		this.countryRegionCode = countryRegionCode;
	}

	public String getCountryRegionName() {
		return this.countryRegionName;
	}

	public void setCountryRegionName(String countryRegionName) {
		this.countryRegionName = countryRegionName;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getStateProvinceCode() {
		return this.stateProvinceCode;
	}

	public void setStateProvinceCode(String stateProvinceCode) {
		this.stateProvinceCode = stateProvinceCode;
	}

	public String getStateProvinceName() {
		return this.stateProvinceName;
	}

	public void setStateProvinceName(String stateProvinceName) {
		this.stateProvinceName = stateProvinceName;
	}

	public List<Customer> getDimCustomers() {
		return this.dimCustomers;
	}

	public void setDimCustomers(List<Customer> dimCustomers) {
		this.dimCustomers = dimCustomers;
	}

	public Customer addDimCustomer(Customer dimCustomer) {
		getDimCustomers().add(dimCustomer);
		dimCustomer.setDimGeography(this);

		return dimCustomer;
	}

	public Customer removeDimCustomer(Customer dimCustomer) {
		getDimCustomers().remove(dimCustomer);
		dimCustomer.setDimGeography(null);

		return dimCustomer;
	}

}