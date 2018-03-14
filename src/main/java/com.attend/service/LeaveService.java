package com.attend.service;

import com.attend.entity.Leave;
import com.attend.exception.BusinessException;
import com.attend.param.LeaveQueryParam;
import com.attend.util.PageUtil;

import java.util.List;

/**
 * Created by bowen on 2018-03-14 22:55
 */
public interface LeaveService {

    List<Leave> findForPage(LeaveQueryParam leaveQueryParam, PageUtil pageUtil);

    int add(Leave leave);

    int update(Leave leave);

    Leave findById(Integer id);
}
