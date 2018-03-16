package com.attend.service.impl;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.attend.constant.CommonConstant;
import com.attend.constant.ErrorCodeEnum;
import com.attend.exception.BusinessException;
import com.attend.mapper.MemberMapper;
import com.attend.entity.Member;
import com.attend.param.MemberQueryParam;
import com.attend.service.MemberService;
import com.attend.util.MD5Util;
import com.attend.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

/**
 */
@Service
public class MemberServiceImpl implements MemberService {
    private static final Logger LOG = LoggerFactory.getLogger(MemberServiceImpl.class);

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Member> findAll() {
        return memberMapper.selectAll();
    }

    @Override
    public List<Member> findAllForValid() {
        Example example = new Example(Member.class);
        example.createCriteria().andEqualTo("joinSchedue", CommonConstant.VALID);
        return memberMapper.selectByExample(example);
    }

    @Override
    public List<Member> findForPage(MemberQueryParam memberQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Member.class);
        example.createCriteria().andNotEqualTo("status", CommonConstant.DELETE);
        example.setOrderByClause("id DESC");
        List<Member> list = memberMapper.selectByExample(example);
        pageUtil.setRecordCount(memberMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public int add(Member member) {
        member.setStatus(CommonConstant.VALID);
        member.setJoinSchedue(CommonConstant.VALID);
        return memberMapper.insert(member);
    }

    @Override
    public int update(Member member) {
        return memberMapper.updateByPrimaryKeySelective(member);
    }

    @Override
    public Member login(Member member) throws BusinessException {
        if(Objects.isNull(member)){
            throw new BusinessException(ErrorCodeEnum.PARAM_NULL);
        }else if(StringUtils.isEmpty(member.getAccount())){
            throw new BusinessException(ErrorCodeEnum.LGOIN_ACCOUNT_NULL);
        }else if(StringUtils.isEmpty(member.getPassword())){
            throw new BusinessException(ErrorCodeEnum.LOGIN_PASSWORD_NULL);
        }
        member.setPassword(MD5Util.EncoderByMd5(member.getPassword()));
        Member obj = memberMapper.selectOne(member);
        return Optional.ofNullable(obj).orElseThrow(() -> new BusinessException(ErrorCodeEnum.LOGIN_ERROR));
    }

    @Override
    public Member findByMemberId(Integer memberId) {
        return memberMapper.selectByPrimaryKey(memberId);
    }
}
