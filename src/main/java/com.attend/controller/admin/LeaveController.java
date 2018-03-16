package com.attend.controller.admin;

import com.attend.constant.CommonConstant;
import com.attend.constant.StatusEnum;
import com.attend.entity.Leave;
import com.attend.param.LeaveQueryParam;
import com.attend.service.LeaveService;
import com.attend.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Objects;

/**
 */
@Controller
@RequestMapping("/admin/leave/")
public class LeaveController {

    @Autowired
    private LeaveService leaveService;

    @RequestMapping("index")
    public ModelAndView index(LeaveQueryParam leaveQueryParam, PageUtil pageUtil){
        ModelAndView modelAndView = new ModelAndView();
        List<Leave> list = leaveService.findForPage(leaveQueryParam, pageUtil);
        if(Objects.equals(StatusEnum.LeaveTypeEnum.LEAVE.getType(), leaveQueryParam.getType())){
            modelAndView.setViewName("/admin/leave");
        }else{
            modelAndView.setViewName("/admin/travel");
        }
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("update")
    public String update(Leave leave){
        leave.setStatus(CommonConstant.VALID);
        leaveService.update(leave);
        return "redirect:/admin/leave/index?type=" + leave.getType();
    }

}