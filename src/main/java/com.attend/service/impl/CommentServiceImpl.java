package com.attend.service.impl;

import com.github.pagehelper.PageHelper;
import com.attend.dto.CommentDTO;
import com.attend.entity.Article;
import com.attend.entity.Comment;
import com.attend.mapper.CommentMapper;
import com.attend.param.CommentQueryParam;
import com.attend.service.CommentService;
import com.attend.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

/**
 */
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int add(Comment comment) {
        Date now = new Date();
        comment.setCreateTime(now);
        comment.setUpdateTime(now);
        return commentMapper.insert(comment);
    }

    @Override
    public List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Article.class);
        example.setOrderByClause("id DESC");
        List<Comment> list = commentMapper.selectByExample(example);
        pageUtil.setRecordCount(commentMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        List<CommentDTO> list = commentMapper.findPageCommentByMemberId(memberId);
        pageUtil.setRecordCount(commentMapper.findCountCommentByMemberId(memberId));
        return list;
    }


}
