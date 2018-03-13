package com.attend.controller.admin;

import com.attend.entity.Member;
import com.attend.exception.BusinessException;
import com.attend.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by bowen on 2018-02-28 00:14
 */
@Controller
@RequestMapping("/admin/")
public class LonginController {

    @Autowired
    private MemberService memberService;

    @RequestMapping("/")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg", "asdfa");
        modelAndView.setViewName("/admin/login");
        return modelAndView;
    }

    @RequestMapping("login")
    public ModelAndView login(Member member, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        try {
            Member longMember = memberService.login(member);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("memberId", longMember.getId());
            httpSession.setAttribute("name", longMember.getName());
            modelAndView.setViewName("/admin/index");
        } catch (BusinessException e) {
            modelAndView.addObject("code", e.getCode());
            modelAndView.getModel().put("msg", e.getMsg());
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        HttpSession session1 = request.getSession();
        session1.invalidate();
        return "redirect:/admin/";

    }
}
