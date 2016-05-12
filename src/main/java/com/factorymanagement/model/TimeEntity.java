
package com.factorymanagement.model;

import java.io.Serializable;

import javax.persistence.Entity;

@Entity
public class TimeEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	@javax.persistence.Id
	private long Id;
	private Integer numberOfDays;
	private Integer numberOfHours;
	private Integer numberOfMinutes;

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public Integer getNumberOfDays() {
		return numberOfDays;
	}

	public void setNumberOfDays(Integer numberOfDays) {
		this.numberOfDays = numberOfDays;
	}

	public Integer getNumberOfHours() {
		return numberOfHours;
	}

	public void setNumberOfHours(Integer numberOfHours) {
		this.numberOfHours = numberOfHours;
	}

	public Integer getNumberOfMinutes() {
		return numberOfMinutes;
	}

	public void setNumberOfMinutes(Integer numberOfMinutes) {
		this.numberOfMinutes = numberOfMinutes;
	}


	@Override
	public String toString() {

		return numberOfHours + "h" + numberOfMinutes+"m";
	}
}
