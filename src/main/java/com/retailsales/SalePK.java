package com.retailsales;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Sales database table.
 * 
 */
@Embeddable
public class SalePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private String salesOrderNumber;

	private int salesOrderLineNumber;

	public SalePK() {
	}
	public String getSalesOrderNumber() {
		return this.salesOrderNumber;
	}
	public void setSalesOrderNumber(String salesOrderNumber) {
		this.salesOrderNumber = salesOrderNumber;
	}
	public int getSalesOrderLineNumber() {
		return this.salesOrderLineNumber;
	}
	public void setSalesOrderLineNumber(int salesOrderLineNumber) {
		this.salesOrderLineNumber = salesOrderLineNumber;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof SalePK)) {
			return false;
		}
		SalePK castOther = (SalePK)other;
		return 
			this.salesOrderNumber.equals(castOther.salesOrderNumber)
			&& (this.salesOrderLineNumber == castOther.salesOrderLineNumber);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.salesOrderNumber.hashCode();
		hash = hash * prime + this.salesOrderLineNumber;
		
		return hash;
	}
}