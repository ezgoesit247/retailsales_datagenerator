package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the VendorProduct database table.
 * 
 */
@Entity
@NamedQuery(name="VendorProduct.findAll", query="SELECT v FROM VendorProduct v")
public class VendorProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pk;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="ProductKey")
	private Product dimProduct;

	//bi-directional many-to-one association to Vendor
	@ManyToOne
	@JoinColumn(name="VendorKey")
	private Vendor dimVendor;

	public VendorProduct() {
	}

	public int getPk() {
		return this.pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}

	public Product getDimProduct() {
		return this.dimProduct;
	}

	public void setDimProduct(Product dimProduct) {
		this.dimProduct = dimProduct;
	}

	public Vendor getDimVendor() {
		return this.dimVendor;
	}

	public void setDimVendor(Vendor dimVendor) {
		this.dimVendor = dimVendor;
	}

}