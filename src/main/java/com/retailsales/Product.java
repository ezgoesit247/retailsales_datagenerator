package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the DimProduct database table.
 * 
 */
@Entity
@Table(name="DimProduct")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int productKey;

	private BigDecimal listPrice;

	private String product;

	private BigDecimal size;

	private String sizeUnitMeasureCode;

	private BigDecimal standardCost;

	private BigDecimal weight;

	private String weightUnitMeasureCode;

	//bi-directional many-to-one association to Brand
	@OneToMany(mappedBy="dimProduct")
	private List<Brand> dimBrands;

	//bi-directional many-to-one association to Model
	@OneToMany(mappedBy="dimProduct")
	private List<Model> dimModels;

	//bi-directional many-to-one association to ProductSubcategory
	@ManyToOne
	@JoinColumn(name="SubcategoryKey")
	private ProductSubcategory dimProductSubcategory;

	//bi-directional many-to-one association to Sale
	@OneToMany(mappedBy="dimProduct")
	private List<Sale> sales;

	//bi-directional many-to-one association to VendorProduct
	@OneToMany(mappedBy="dimProduct")
	private List<VendorProduct> vendorProducts;

	public Product() {
	}

	public int getProductKey() {
		return this.productKey;
	}

	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}

	public BigDecimal getListPrice() {
		return this.listPrice;
	}

	public void setListPrice(BigDecimal listPrice) {
		this.listPrice = listPrice;
	}

	public String getProduct() {
		return this.product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public BigDecimal getSize() {
		return this.size;
	}

	public void setSize(BigDecimal size) {
		this.size = size;
	}

	public String getSizeUnitMeasureCode() {
		return this.sizeUnitMeasureCode;
	}

	public void setSizeUnitMeasureCode(String sizeUnitMeasureCode) {
		this.sizeUnitMeasureCode = sizeUnitMeasureCode;
	}

	public BigDecimal getStandardCost() {
		return this.standardCost;
	}

	public void setStandardCost(BigDecimal standardCost) {
		this.standardCost = standardCost;
	}

	public BigDecimal getWeight() {
		return this.weight;
	}

	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}

	public String getWeightUnitMeasureCode() {
		return this.weightUnitMeasureCode;
	}

	public void setWeightUnitMeasureCode(String weightUnitMeasureCode) {
		this.weightUnitMeasureCode = weightUnitMeasureCode;
	}

	public List<Brand> getDimBrands() {
		return this.dimBrands;
	}

	public void setDimBrands(List<Brand> dimBrands) {
		this.dimBrands = dimBrands;
	}

	public Brand addDimBrand(Brand dimBrand) {
		getDimBrands().add(dimBrand);
		dimBrand.setDimProduct(this);

		return dimBrand;
	}

	public Brand removeDimBrand(Brand dimBrand) {
		getDimBrands().remove(dimBrand);
		dimBrand.setDimProduct(null);

		return dimBrand;
	}

	public List<Model> getDimModels() {
		return this.dimModels;
	}

	public void setDimModels(List<Model> dimModels) {
		this.dimModels = dimModels;
	}

	public Model addDimModel(Model dimModel) {
		getDimModels().add(dimModel);
		dimModel.setDimProduct(this);

		return dimModel;
	}

	public Model removeDimModel(Model dimModel) {
		getDimModels().remove(dimModel);
		dimModel.setDimProduct(null);

		return dimModel;
	}

	public ProductSubcategory getDimProductSubcategory() {
		return this.dimProductSubcategory;
	}

	public void setDimProductSubcategory(ProductSubcategory dimProductSubcategory) {
		this.dimProductSubcategory = dimProductSubcategory;
	}

	public List<Sale> getSales() {
		return this.sales;
	}

	public void setSales(List<Sale> sales) {
		this.sales = sales;
	}

	public Sale addSale(Sale sale) {
		getSales().add(sale);
		sale.setDimProduct(this);

		return sale;
	}

	public Sale removeSale(Sale sale) {
		getSales().remove(sale);
		sale.setDimProduct(null);

		return sale;
	}

	public List<VendorProduct> getVendorProducts() {
		return this.vendorProducts;
	}

	public void setVendorProducts(List<VendorProduct> vendorProducts) {
		this.vendorProducts = vendorProducts;
	}

	public VendorProduct addVendorProduct(VendorProduct vendorProduct) {
		getVendorProducts().add(vendorProduct);
		vendorProduct.setDimProduct(this);

		return vendorProduct;
	}

	public VendorProduct removeVendorProduct(VendorProduct vendorProduct) {
		getVendorProducts().remove(vendorProduct);
		vendorProduct.setDimProduct(null);

		return vendorProduct;
	}

}