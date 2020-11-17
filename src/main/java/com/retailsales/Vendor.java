package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DimVendor database table.
 * 
 */
@Entity
@Table(name="DimVendor")
@NamedQuery(name="Vendor.findAll", query="SELECT v FROM Vendor v")
public class Vendor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int vendorKey;

	private String vendor;

	//bi-directional many-to-one association to VendorProduct
	@OneToMany(mappedBy="dimVendor")
	private List<VendorProduct> vendorProducts;

	public Vendor() {
	}

	public int getVendorKey() {
		return this.vendorKey;
	}

	public void setVendorKey(int vendorKey) {
		this.vendorKey = vendorKey;
	}

	public String getVendor() {
		return this.vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public List<VendorProduct> getVendorProducts() {
		return this.vendorProducts;
	}

	public void setVendorProducts(List<VendorProduct> vendorProducts) {
		this.vendorProducts = vendorProducts;
	}

	public VendorProduct addVendorProduct(VendorProduct vendorProduct) {
		getVendorProducts().add(vendorProduct);
		vendorProduct.setDimVendor(this);

		return vendorProduct;
	}

	public VendorProduct removeVendorProduct(VendorProduct vendorProduct) {
		getVendorProducts().remove(vendorProduct);
		vendorProduct.setDimVendor(null);

		return vendorProduct;
	}

}