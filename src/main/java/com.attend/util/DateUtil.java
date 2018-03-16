package com.attend.util;

import org.springframework.util.StringUtils;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 */
public class DateUtil {

    public static final String yyyy_MM_dd = "yyyy-MM-dd";

    public static LocalDate date2LocalDate(Date date){
        Instant instant = date.toInstant();
        ZoneId zoneId = ZoneId.systemDefault();
        // atZone()方法返回在指定时区从此Instant生成的ZonedDateTime。
        LocalDate localDate = instant.atZone(zoneId).toLocalDate();
        return localDate;
    }

    public static String localDate2StringDate(LocalDate localDate,String pattern) {
        pattern = StringUtils.isEmpty(pattern) ? yyyy_MM_dd : pattern;
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(pattern);
        return localDate.format(dateTimeFormatter);
    }

    public static String date2StringDate(Date date, String pattern){
        return localDate2StringDate(date2LocalDate(date), pattern);
    }

}
