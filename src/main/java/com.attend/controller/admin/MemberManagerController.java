package com.attend.controller.admin;

import com.attend.constant.CommonConstant;
import com.attend.entity.Member;
import com.attend.param.MemberQueryParam;
import com.attend.service.MemberService;
import java.util.List;
import java.util.Objects;

import com.attend.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping({"/admin/member/"})
public class MemberManagerController
{
    @Autowired
    private MemberService memberService;

    @RequestMapping({"index"})
    public ModelAndView index(MemberQueryParam memberQueryParam, PageUtil pageUtil)
    {
        List<Member> list = this.memberService.findForPage(memberQueryParam , pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/member");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping({"input"})
    public ModelAndView input(Integer memberId, Integer type)
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/memberInput");
        if(Objects.isNull(memberId)){
            return  modelAndView;
        }else {
            Member member = this.memberService.findByMemberId(memberId);
            modelAndView.addObject("member", member);
            modelAndView.addObject("type", type);
            return modelAndView;
        }
    }

    @RequestMapping({"save"})
    public String save(Member memer, Integer type)
    {
        if(Objects.isNull(memer.getId())){
            memberService.add(memer);
        }else{
            memberService.update(memer);
        }
        if(Objects.nonNull(type)){
            return "redirect:/admin/member/info";
        }else{
            return "redirect:/admin/member/index";
        }
    }

    @RequestMapping({"delete"})
    public String delete(Integer memberId)
    {
        Member member = new Member();
        member.setId(memberId);
        member.setStatus(CommonConstant.DELETE);
        this.memberService.update(member);
        return "redirect:/admin/member/index";
    }

    @RequestMapping("memberList")
    @ResponseBody
    public List<Member> memberList(){
        List<Member> list = memberService.findAllForValid();
        return list;
    }

    @RequestMapping("info")
    public ModelAndView info(HttpServletRequest request){
        Integer memberId = (Integer) request.getSession().getAttribute("memberId");
        Member member = memberService.findByMemberId(memberId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/member/member");
        modelAndView.addObject("member", member);
        return modelAndView;
    }
}
