package com.attend.controller.admin;

import com.alibaba.fastjson.JSON;
import com.attend.constant.CommonConstant;
import com.attend.dto.CalendarChartDTO;
import com.attend.entity.Calendar;
import com.attend.entity.Member;
import com.attend.param.CalendarParam;
import com.attend.service.CalendarService;
import com.attend.service.MemberService;
import com.attend.util.PageUtil;
import com.attend.vo.CalendarChartVO;
import com.attend.vo.CalendarVO;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 */
@Controller
@RequestMapping("/admin/fullcalendar/")
public class FullcalendarController {

    @Autowired
    private CalendarService calendarService;
    @Autowired
    private MemberService memberService;

    @RequestMapping("index")
    public ModelAndView index(Integer type){
        ModelAndView modelAndView = new ModelAndView();
        if(Objects.nonNull(type)){
            modelAndView.setViewName("/member/fullcalendar");
        }else {
            modelAndView.setViewName("/admin/fullcalendar");
        }
        return modelAndView;
    }

    @RequestMapping("calendar")
    @ResponseBody
    public List<CalendarVO> index(CalendarParam calendarParam){
        return calendarService.findMonthCalendar(calendarParam);
    }

    @RequestMapping("add")
    public String add(Calendar calendar){
        calendar.setStatus(CommonConstant.VERIFY);
        calendarService.add(calendar);
        return "redirect:/admin/fullcalendar/index";
    }

    @RequestMapping("update")
    public String update(Calendar calendar){
        calendarService.update(calendar);
        return "redirect:/admin/fullcalendar/index";
    }

    @RequestMapping("updateStatus")
    public String updateStatus(Calendar calendar){
        calendarService.update(calendar);
        return "redirect:/admin/fullcalendar/list";
    }

    @RequestMapping("list")
    public ModelAndView list(CalendarParam calendarParam, PageUtil pageUtil){
        ModelAndView modelAndView = new ModelAndView();
        List<Calendar> list = calendarService.findPageList(calendarParam, pageUtil);
        modelAndView.setViewName("/admin/fullcalendarList");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("report")
    public ModelAndView report(){
        ModelAndView modelAndView = new ModelAndView();
        List<CalendarChartDTO> list = calendarService.findReportGroupMonth();
        List<String> category = list.stream().map(t -> t.getName()).distinct().collect(Collectors.toList());
        List<String> titles = list.stream().map(t -> t.getStatus()).distinct().collect(Collectors.toList());
        Map<String, List<CalendarChartDTO>> userCalendarMap = list.stream().collect(Collectors.groupingBy(CalendarChartDTO :: getStatus));
        modelAndView.setViewName("/admin/report");
        modelAndView.addObject("category", JSON.toJSONString(category));
        modelAndView.addObject("titles", JSON.toJSONString(titles));
        List<CalendarChartVO> datas = Lists.newArrayList();
        for(Map.Entry<String, List<CalendarChartDTO>> map : userCalendarMap.entrySet()){
            CalendarChartVO calendarChartVO = new CalendarChartVO();
            calendarChartVO.setName(map.getKey());
            calendarChartVO.setData(map.getValue().stream().map(t -> t.getDays()).collect(Collectors.toList()));
            datas.add(calendarChartVO);
        }

        modelAndView.addObject("datas", JSON.toJSONString(datas));
        return modelAndView;
    }

}
