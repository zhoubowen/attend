package com.attend.service;

import com.attend.dto.CommentDTO;
import com.attend.entity.Comment;
import com.attend.param.CommentQueryParam;
import com.attend.util.PageUtil;

import java.util.List;

/**
 */
public interface CommentService {

    int add(Comment comment);

    List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil);

}
