package com.main.authentication;

public class Validation {
	
	public static <T> boolean loginValidation(T obj, T retrieved) {
		return obj.equals(retrieved);
	}

}
