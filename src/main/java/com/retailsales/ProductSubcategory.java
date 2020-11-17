package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DimProductSubcategory database table.
 * 
 */
@Entity
@Table(name="DimProductSubcategory")
@NamedQuery(name="ProductSubcategory.findAll", query="SELECT p FROM ProductSubcategory p")
public class ProductSubcategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int subcategoryKey;

	private String subcategory;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="dimProductSubcategory")
	private List<Product> dimProducts;

	//bi-directional many-to-one association to ProductCategory
	@ManyToOne
	@JoinColumn(name="CategoryKey")
	private ProductCategory dimProductCategory;

	public ProductSubcategory() {
	}

	public int getSubcategoryKey() {
		return this.subcategoryKey;
	}

	public void setSubcategoryKey(int subcategoryKey) {
		this.subcategoryKey = subcategoryKey;
	}

	public String getSubcategory() {
		return this.subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public List<Product> getDimProducts() {
		return this.dimProducts;
	}

	public void setDimProducts(List<Product> dimProducts) {
		this.dimProducts = dimProducts;
	}

	public Product addDimProduct(Product dimProduct) {
		getDimProducts().add(dimProduct);
		dimProduct.setDimProductSubcategory(this);

		return dimProduct;
	}

	public Product removeDimProduct(Product dimProduct) {
		getDimProducts().remove(dimProduct);
		dimProduct.setDimProductSubcategory(null);

		return dimProduct;
	}

	public ProductCategory getDimProductCategory() {
		return this.dimProductCategory;
	}

	public void setDimProductCategory(ProductCategory dimProductCategory) {
		this.dimProductCategory = dimProductCategory;
	}

}