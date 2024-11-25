package com.main.authentication;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.main.bean.Transaction;

public class Records {
	
	public static List<String> getChartLabel(int months) {
		List<String> labels = null;
		
		if(months==3) {
			String[] month = {"Jan", "Feb", "Mar"};
			labels = Arrays.asList(month);
		}
		else if(months==6) {
			String[] month = {"Jan", "Feb", "Mar", "Apr", "May", "Jun"};
			labels = Arrays.asList(month);
		}
		else if(months==12) {
			String[] month = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
			labels = Arrays.asList(month);
		}
		
		return labels;
	}
	
	public static Map<Integer, String> getChartData(List<Transaction> records, int months) {
		Map<Integer, String> data = new HashMap<>();
		
		for(int i=1;i<=months;i++) {
			data.put(i, "0");
		}
		
		for(Transaction record:records) {
			data.put(Integer.parseInt(record.getDate()), record.getAmount());
		}
		
		return data;
	}

}
