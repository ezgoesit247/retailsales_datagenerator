package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the DimBrand database table.
 * 
 */
@Entity
@Table(name="DimBrand")
@NamedQuery(name="Brand.findAll", query="SELECT b FROM Brand b")
public class Brand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int brandKey;

	private String brand;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="ProductKey")
	private Product dimProduct;

	public Brand() {
	}

	public int getBrandKey() {
		return this.brandKey;
	}

	public void setBrandKey(int brandKey) {
		this.brandKey = brandKey;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Product getDimProduct() {
		return this.dimProduct;
	}

	public void setDimProduct(Product dimProduct) {
		this.dimProduct = dimProduct;
	}

}