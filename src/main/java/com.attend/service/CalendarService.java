package com.attend.service;

import com.attend.entity.Calendar;
import com.attend.param.CalendarParam;
import com.attend.vo.CalendarVO;

import java.util.List;

/**
 */
public interface CalendarService {

    List<CalendarVO> findMonthCalendar(CalendarParam calendarParam);

    int add(Calendar calendar);

    int update(Calendar calendar);
}
