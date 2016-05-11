
package com.factorymanagement.util;

import com.factorymanagement.model.TimeEntity;

public class TimeEntityHelper {

	/**
	 * @param productDuration
	 *            like 30h15m
	 * @return
	 */
	public static TimeEntity convertToTimeEntity(String productDuration) {
		int lastIndexOfH = productDuration.lastIndexOf("h");
		int indexOfM = productDuration.indexOf("m");
		String numberOfHours = productDuration.substring(0, lastIndexOfH);
		String numberOfMinutes = productDuration.substring(lastIndexOfH + 1, indexOfM - 1);
		TimeEntity timeEntity = new TimeEntity();
		timeEntity.setNumberOfHours(Integer.valueOf(numberOfHours));
		timeEntity.setNumberOfMinutes(Integer.valueOf(numberOfMinutes));
		return timeEntity;
	}

	/**
	 * @param timeEntity
	 * @param numberOfQuantity
	 * @return
	 */
	public static TimeEntity multiplyByNumberOfQuantity(TimeEntity timeEntity, Integer numberOfQuantity) {
		Integer numberOfHours = timeEntity.getNumberOfHours();
		Integer numberOfMinutes = timeEntity.getNumberOfMinutes();
		Integer totalNumberOfHours = numberOfHours * numberOfQuantity;
		Integer totalNumberOfMinutes = numberOfMinutes * numberOfQuantity;
		TimeEntity result = new TimeEntity();
		result.setNumberOfHours(totalNumberOfHours);
		result.setNumberOfMinutes(totalNumberOfMinutes);
		return result;
	}

}
