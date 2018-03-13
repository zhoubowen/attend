package com.attend.service;

import com.attend.entity.Member;
import com.attend.exception.BusinessException;
import com.attend.param.MemberQueryParam;
import com.attend.util.PageUtil;

import java.util.List;
import java.util.Map;

/**
 * Created by bowen on 2018-02-27 00:24
 */
public interface MemberService {

    List<Member> findAll();

    List<Member> findAllForValid();

    List<Member> findForPage(MemberQueryParam memberQueryParam, PageUtil pageUtil);

    int add(Member member);

    int update(Member member);

    Member login(Member member) throws BusinessException;

    Member findByMemberId(Integer memberId);
}
