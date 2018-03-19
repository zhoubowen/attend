package com.attend.mapper;

import com.attend.dto.CalendarChartDTO;
import com.attend.entity.Calendar;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 */
public interface CalendarMapper extends Mapper<Calendar> {

    List<CalendarChartDTO> findReportGroupMonth();
}
