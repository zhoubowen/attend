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

import javax.servlet.http.HttpServletRequest;
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
            if(Objects.nonNull(leaveQueryParam.getMemberId())){
                modelAndView.setViewName("/member/leave");
            }else{
                modelAndView.setViewName("/admin/leave");
            }
        }else{
            if(Objects.nonNull(leaveQueryParam.getMemberId())){
                modelAndView.setViewName("/member/travel");
            }else{
                modelAndView.setViewName("/admin/travel");
            }
        }
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("update")
    public String update(Leave leave){
        leaveService.update(leave);
        return "redirect:/admin/leave/index?type=" + leave.getType();
    }


    @RequestMapping("save")
    public String save(Leave leave, HttpServletRequest request){
        Integer memberId = (Integer) request.getSession().getAttribute("memberId");
        leave.setStatus(CommonConstant.VERIFY);
        leave.setType(StatusEnum.LeaveTypeEnum.LEAVE.getType());
        leave.setUserId(memberId);
        leaveService.add(leave);
        return "redirect:/admin/leave/index?type=0&&memberId=" + memberId;
    }

    @RequestMapping("input")
    public ModelAndView input(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/leaveInput");
        return modelAndView;
    }

}
