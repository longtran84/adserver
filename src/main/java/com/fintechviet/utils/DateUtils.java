package com.fintechviet.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * Created by tungn on 9/1/2017.
 */
public class DateUtils {
    private static String FORMAT_DATE = "dd/MM/yyyy HH:mm:SS";
    public static String EQUAL = "EQUAL";
    public static String BEFORE = "BEFORE";
    public static String AFTER = "AFTER";

    public static Date convertStringToDate(String dateStr) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(FORMAT_DATE);
            return dateFormat.parse(dateStr);
        } catch (ParseException ex){
        }
        return null;
    }

    public static String compare(String d1, String d2) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:SS");
            Date date1 = sdf.parse(d1);
            Date date2 = sdf.parse(d2);

            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(date1);
            cal2.setTime(date2);

            if (cal1.after(cal2)) {
                return DateUtils.AFTER;
            }

            if (cal1.before(cal2)) {
                return DateUtils.BEFORE;
            }

            if (cal1.equals(cal2)) {
                return DateUtils.EQUAL;
            }
        } catch (ParseException ex){
        }
        return DateUtils.EQUAL;
    }
}
