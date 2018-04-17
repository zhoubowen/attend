package com.attend.controller.admin;

import com.attend.constant.CommonConstant;
import com.attend.constant.StatusEnum;
import com.attend.entity.Leave;
import com.attend.entity.Member;
import com.attend.param.LeaveQueryParam;
import com.attend.service.LeaveService;
import com.attend.service.MemberService;
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
    @Autowired
    private MemberService memberService;

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
        Integer memberId = null;
        leave.setStatus(CommonConstant.VERIFY);
//        leave.setType(StatusEnum.LeaveTypeEnum.LEAVE.getType());
        if (Objects.isNull(leave.getUserId())){
            memberId = (Integer) request.getSession().getAttribute("memberId");
            leave.setUserId(memberId);
        }
        leaveService.add(leave);
        if(Objects.equals(leave.getType(), StatusEnum.LeaveTypeEnum.LEAVE.getType())){
            return "redirect:/admin/leave/index?type=" + leave.getType() + "&memberId=" + memberId;
        }else{
            return "redirect:/admin/leave/index?type=" + leave.getType();
        }
    }

    @RequestMapping("input")
    public ModelAndView input(Integer type){
        ModelAndView modelAndView = new ModelAndView();
        if(Objects.equals(type, StatusEnum.LeaveTypeEnum.LEAVE.getType())){
            modelAndView.setViewName("/admin/leaveInput");
        }else{
            List<Member> members = memberService.findAllForValid();
            modelAndView.addObject("members", members);
            modelAndView.setViewName("/admin/travelInput");
        }
        modelAndView.addObject("type", type);
        return modelAndView;
    }

}
