package com.main.authentication;

public class Validation {
	
	public static <T> boolean loginValidation(T obj, T retrieved) {
		return obj.equals(retrieved);
	}
	
	public static boolean amountValidation(String amount) {
		String regex = "^\\d+(\\.\\d{1,2})?$";
		return amount.matches(regex);
	}

}
