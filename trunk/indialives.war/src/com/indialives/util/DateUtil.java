package com.indialives.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static final String DD_MM_YYYY="dd-MM-yyyy";
	public static final String DD_MM_YYYY__HH_MM_A="dd-MM-yyyy hh:mm a";
	public static Date getDateFromString(String dateString){
		Date date=null;
		try{
			SimpleDateFormat dateFormat = new SimpleDateFormat(DD_MM_YYYY);
			date = dateFormat.parse(dateString);
		}
		catch(ParseException e){
			date=null;
		}
		return date;		
	}
	public static String getStringFromDate(Date date){
		String dateString="";
			SimpleDateFormat dateFormat = new SimpleDateFormat(DD_MM_YYYY__HH_MM_A);
			dateString = dateFormat.format(date);
		return dateString;		
	}
	
}
