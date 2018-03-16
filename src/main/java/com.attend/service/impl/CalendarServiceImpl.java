package com.attend.service.impl;

import com.attend.entity.Calendar;
import com.attend.entity.Member;
import com.attend.mapper.CalendarMapper;
import com.attend.mapper.MemberMapper;
import com.attend.param.CalendarParam;
import com.attend.service.CalendarService;
import com.attend.util.DateUtil;
import com.attend.vo.CalendarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * Created by bowen on 2018-03-16 01:02
 */
@Service
public class CalendarServiceImpl implements CalendarService {

    @Autowired
    private CalendarMapper calendarMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<CalendarVO> findMonthCalendar(CalendarParam calendarParam) {
        List<Calendar> list = calendarMapper.selectAll();
        return list.stream().map(t -> {
            Member member = memberMapper.selectByPrimaryKey(t.getUserId());
            CalendarVO calendarVO = new CalendarVO();
            calendarVO.setId(t.getId());
            calendarVO.setTitle(member.getName());
            calendarVO.setStart(DateUtil.date2StringDate(t.getDutyBeginDate(), DateUtil.yyyy_MM_dd));
            if(Objects.nonNull(t.getDutyEndDate())){
                calendarVO.setEnd(DateUtil.date2StringDate(t.getDutyEndDate(), DateUtil.yyyy_MM_dd));
            }
            return calendarVO;
        }).collect(Collectors.toList());
    }

    @Override
    public int add(Calendar calendar) {
        return calendarMapper.insert(calendar);
    }

    @Override
    public int update(Calendar calendar) {
        return calendarMapper.updateByPrimaryKeySelective(calendar);
    }
}
