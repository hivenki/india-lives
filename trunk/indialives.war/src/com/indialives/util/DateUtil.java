package com.indialives.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static Date getDateFromString(String dateString,String formatPattern){
		Date date=null;
		try{
			SimpleDateFormat dateFormat = new SimpleDateFormat(formatPattern);
			date = dateFormat.parse(dateString);
		}
		catch(ParseException e){
			date=null;
		}
		return date;		
	}
}
