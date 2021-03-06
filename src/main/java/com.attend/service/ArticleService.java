package com.attend.service;

import com.attend.entity.Article;
import com.attend.param.ArticleQueryParam;
import com.attend.util.PageUtil;

import java.util.List;

/**
 */
public interface ArticleService {

    List<Article> findAllByExample(Integer type, Integer status);

    List<Article> findForPage(ArticleQueryParam articleQueryParam, PageUtil pageUtil);

    int add(Article article);

    int update(Article article);

    Article findById(Integer id);
}
