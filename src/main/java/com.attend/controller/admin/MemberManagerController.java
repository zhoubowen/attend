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
    public ModelAndView input(Integer memberId)
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/memberInput");
        if(Objects.isNull(memberId)){
            return  modelAndView;
        }else {
            Member member = this.memberService.findByMemberId(memberId);
            modelAndView.addObject("member", member);
            return modelAndView;
        }
    }

    @RequestMapping({"save"})
    public String save(Member memer)
    {
        if(Objects.isNull(memer.getId())){
            memberService.add(memer);
        }else{
            memberService.update(memer);
        }
        return "redirect:/admin/member/index";
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
}
