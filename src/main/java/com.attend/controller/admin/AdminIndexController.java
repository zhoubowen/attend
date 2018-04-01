package com.attend.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminIndexController
{
    @RequestMapping({"/"})
    public ModelAndView index()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/login");
        return modelAndView;
    }

    @RequestMapping("/member")
    public ModelAndView memberIndex()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/member/login");
        return modelAndView;
    }
}
