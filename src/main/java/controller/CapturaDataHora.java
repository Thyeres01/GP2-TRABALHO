package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CapturaDataHora {

	public String getDateTime() {
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Date date = new Date();
		System.out.println(format.format(date));
		return format.format(date);
	}
}
