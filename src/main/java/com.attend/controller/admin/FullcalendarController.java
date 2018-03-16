package com.attend.controller.admin;

import com.attend.entity.Calendar;
import com.attend.entity.Member;
import com.attend.param.CalendarParam;
import com.attend.service.CalendarService;
import com.attend.service.MemberService;
import com.attend.vo.CalendarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Objects;

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
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/fullcalendar");
        return modelAndView;
    }

    @RequestMapping("calendar")
    @ResponseBody
    public List<CalendarVO> index(CalendarParam calendarParam){
        return calendarService.findMonthCalendar(calendarParam);
    }

    @RequestMapping("add")
    public String add(Calendar calendar){
        calendarService.add(calendar);
        return "redirect:/admin/fullcalendar/index";
    }

    @RequestMapping("update")
    public String update(Calendar calendar){
        calendarService.update(calendar);
        return "redirect:/admin/fullcalendar/index";
    }

}
