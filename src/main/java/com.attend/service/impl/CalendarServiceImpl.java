package com.attend.service.impl;

import com.attend.dto.CalendarChartDTO;
import com.attend.entity.Calendar;
import com.attend.entity.Member;
import com.attend.mapper.CalendarMapper;
import com.attend.mapper.MemberMapper;
import com.attend.param.CalendarParam;
import com.attend.service.CalendarService;
import com.attend.util.DateUtil;
import com.attend.util.PageUtil;
import com.attend.vo.CalendarVO;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 */
@Service
public class CalendarServiceImpl implements CalendarService {

    @Autowired
    private CalendarMapper calendarMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<CalendarVO> findMonthCalendar(CalendarParam calendarParam) {
        Example example = new Example(Calendar.class);
        if(Objects.nonNull(calendarParam.getMemberId())){
            example.createCriteria().andEqualTo("userId", calendarParam.getMemberId());
        }
        List<Calendar> list = calendarMapper.selectByExample(example);
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

    public List<Calendar> findPageList(CalendarParam calendarParam, PageUtil pageUtil){
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Calendar.class);
//        example.createCriteria().andEqualTo("type", leaveQueryParam.getType());
        example.setOrderByClause("id DESC");
        List<Calendar> list = calendarMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Calendar leave : list){
                Member member = memberMapper.selectByPrimaryKey(leave.getUserId());
                leave.setMember(member);
            }
        }
        pageUtil.setRecordCount(calendarMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public List<CalendarChartDTO> findReportGroupMonth() {
        return calendarMapper.findReportGroupMonth();
    }
}
