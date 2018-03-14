package com.attend.controller.admin;

import com.attend.constant.CommonConstant;
import com.attend.entity.Article;
import com.attend.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

/**
 */
@Controller
@RequestMapping("/admin/supply/")
public class SupplyController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("index")
    public ModelAndView index(@RequestParam(name = "type", defaultValue = "0") Integer type,
                              @RequestParam(name = "status", defaultValue = "1") Integer status){
        List<Article> list = articleService.findAllByExample(type, status);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/supply");
        modelAndView.addObject("list", list);
        return modelAndView;
    }

    @RequestMapping("input")
    public ModelAndView input(Integer id){
        Article article = articleService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/supplyInput");
        modelAndView.addObject("article", article);
        return modelAndView;
    }

    @RequestMapping("save")
    public String save(Article article, HttpServletRequest request){
        if(null == article.getId()){
            article.setCreateBy((Integer) request.getSession().getAttribute("memberId"));
            articleService.add(article);
        }else{
            articleService.update(article);
        }
        return "redirect:/admin/supply/index?type=" + article.getType();
    }

    @RequestMapping("delete")
    public String delete(Integer id, Integer type){
        Article article = new Article();
        article.setId(id);
        article.setStatus(CommonConstant.DELETE);
        articleService.update(article);
        return "redirect:/admin/supply/index?type=" + type;
    }
}
