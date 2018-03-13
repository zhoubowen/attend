package com.attend.service;

import com.attend.dto.CommentDTO;
import com.attend.entity.Comment;
import com.attend.param.CommentQueryParam;
import com.attend.util.PageUtil;

import java.util.List;

/**
 * Created by bowen on 2018-03-06 22:54
 */
public interface CommentService {

    int add(Comment comment);

    List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil);

}
