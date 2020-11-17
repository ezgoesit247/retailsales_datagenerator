package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the DimModel database table.
 * 
 */
@Entity
@Table(name="DimModel")
@NamedQuery(name="Model.findAll", query="SELECT m FROM Model m")
public class Model implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int modelKey;

	private String model;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="ProductKey")
	private Product dimProduct;

	public Model() {
	}

	public int getModelKey() {
		return this.modelKey;
	}

	public void setModelKey(int modelKey) {
		this.modelKey = modelKey;
	}

	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Product getDimProduct() {
		return this.dimProduct;
	}

	public void setDimProduct(Product dimProduct) {
		this.dimProduct = dimProduct;
	}

}