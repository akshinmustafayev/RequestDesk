package org.RequestDesk.misc;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeUtil 
{	
	public static String GetTimeNow() 
	{
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime today = LocalDateTime.now();
		return formatter.format(today);
	}
}
