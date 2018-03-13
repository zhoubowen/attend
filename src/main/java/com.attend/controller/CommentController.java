package com.attend.controller;

import com.attend.dto.CommentDTO;
import com.attend.entity.Comment;
import com.attend.param.CommentQueryParam;
import com.attend.response.BaseResponse;
import com.attend.response.ErrorResponse;
import com.attend.response.SuccessResponse;
import com.attend.service.CommentService;
import com.attend.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by bowen on 2018-03-06 23:02
 */
@Controller
@RequestMapping("/comment/")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("add")
    @ResponseBody
    public Object addComment(Comment comment, HttpServletRequest request){
        try {
            Integer memberId = (Integer) request.getSession().getAttribute("memberId");
//            if(null == memberId){
//                return "redirect:/member/loginInput";
//            }
            comment.setMemberId(memberId);
            int row = commentService.add(comment);
            if(row > 0){
                return SuccessResponse.newInstance();
            }else{
                return ErrorResponse.newInstance();
            }
        } catch (Exception e) {
            return ErrorResponse.newInstance();
        }
    }

    @RequestMapping("list")
    public ModelAndView list(HttpServletRequest request, PageUtil pageUtil){
        Integer memberId = (Integer) request.getSession().getAttribute("memberId");
        List<CommentDTO> list = commentService.findPageCommentByMemberId(memberId, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("comment");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

}
