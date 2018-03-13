package com.attend.service.impl;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.attend.constant.CommonConstant;
import com.attend.entity.Article;
import com.attend.entity.Member;
import com.attend.mapper.ArticleMapper;
import com.attend.mapper.MemberMapper;
import com.attend.param.ArticleQueryParam;
import com.attend.service.ArticleService;
import com.attend.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by bowen on 2018-02-27 22:43
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Article> findAllByExample(Integer type, Integer status) {
        Example example = new Example(Article.class);
        example.createCriteria().andEqualTo("type", type).andEqualTo("status", status);
        List<Article> list = articleMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Article article : list){
                Member member = memberMapper.selectByPrimaryKey(article.getCreateBy());
                article.setMember(member);
            }
        }
        return list;
    }

    @Override
    public List<Article> findForPage(ArticleQueryParam articleQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Article.class);
        example.setOrderByClause("id DESC");
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("type", articleQueryParam.getType());
        if(null != articleQueryParam.getMemberId()){
            criteria.andEqualTo("createBy", articleQueryParam.getMemberId());
            criteria.andNotEqualTo("status", CommonConstant.DELETE);
        }else{
            criteria.andEqualTo("status", CommonConstant.VALID);
        }
        List<Article> list = articleMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Article article : list){
                Member member = memberMapper.selectByPrimaryKey(article.getCreateBy());
                article.setMember(member);
            }
        }
        pageUtil.setRecordCount(articleMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public int add(Article article) {
        return articleMapper.insert(article);
    }

    @Override
    public int update(Article article) {
        return articleMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    public Article findById(Integer id) {
        Article article = articleMapper.selectByPrimaryKey(id);
        if(Objects.nonNull(article)){
            Member member = memberMapper.selectByPrimaryKey(article.getCreateBy());
            article.setMember(member);
        }
        return article;
    }
}
