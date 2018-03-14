package com.attend.mapper;

import com.attend.dto.CommentDTO;
import com.attend.entity.Comment;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 */
public interface CommentMapper extends Mapper<Comment> {

    List<CommentDTO> findPageCommentByMemberId(Integer memberId);

    Integer findCountCommentByMemberId(Integer memberId);
}
