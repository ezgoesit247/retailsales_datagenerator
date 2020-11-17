package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DimProductCategory database table.
 * 
 */
@Entity
@Table(name="DimProductCategory")
@NamedQuery(name="ProductCategory.findAll", query="SELECT p FROM ProductCategory p")
public class ProductCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int categoryKey;

	private String category;

	//bi-directional many-to-one association to ProductSubcategory
	@OneToMany(mappedBy="dimProductCategory")
	private List<ProductSubcategory> dimProductSubcategories;

	public ProductCategory() {
	}

	public int getCategoryKey() {
		return this.categoryKey;
	}

	public void setCategoryKey(int categoryKey) {
		this.categoryKey = categoryKey;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<ProductSubcategory> getDimProductSubcategories() {
		return this.dimProductSubcategories;
	}

	public void setDimProductSubcategories(List<ProductSubcategory> dimProductSubcategories) {
		this.dimProductSubcategories = dimProductSubcategories;
	}

	public ProductSubcategory addDimProductSubcategory(ProductSubcategory dimProductSubcategory) {
		getDimProductSubcategories().add(dimProductSubcategory);
		dimProductSubcategory.setDimProductCategory(this);

		return dimProductSubcategory;
	}

	public ProductSubcategory removeDimProductSubcategory(ProductSubcategory dimProductSubcategory) {
		getDimProductSubcategories().remove(dimProductSubcategory);
		dimProductSubcategory.setDimProductCategory(null);

		return dimProductSubcategory;
	}

}