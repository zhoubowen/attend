package com.attend.service.impl;

import com.attend.constant.CommonConstant;
import com.attend.entity.Leave;
import com.attend.entity.Member;
import com.attend.exception.BusinessException;
import com.attend.mapper.LeaveMapper;
import com.attend.mapper.MemberMapper;
import com.attend.param.LeaveQueryParam;
import com.attend.service.LeaveService;
import com.attend.util.PageUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

/**
 * Created by bowen on 2018-03-14 22:57
 */
@Service
public class LeaveServiceImpl implements LeaveService{

    @Autowired
    private LeaveMapper leaveMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Leave> findForPage(LeaveQueryParam leaveQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Leave.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("type", leaveQueryParam.getType());
        if(Objects.nonNull(leaveQueryParam.getMemberId())){
            criteria.andEqualTo("userId", leaveQueryParam.getMemberId());
        }
        example.setOrderByClause("id DESC");
        List<Leave> list = leaveMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Leave leave : list){
                Member member = memberMapper.selectByPrimaryKey(leave.getUserId());
                leave.setMember(member);
            }
        }
        pageUtil.setRecordCount(leaveMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public int add(Leave leave) {
        return leaveMapper.insert(leave);
    }

    @Override
    public int update(Leave leave) {
        return leaveMapper.updateByPrimaryKeySelective(leave);
    }

    @Override
    public Leave findById(Integer id) {
        Leave leave = leaveMapper.selectByPrimaryKey(id);
        if(Objects.nonNull(leave)){
            Member member = memberMapper.selectByPrimaryKey(leave.getUserId());
            leave.setMember(member);
        }
        return leave;
    }
}
