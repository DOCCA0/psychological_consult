package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.DoctorEntity;

import java.util.Map;

/**
 * 心理咨询师用户表
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:07
 */
public interface DoctorService extends IService<DoctorEntity> {

    PageUtils queryPage(Map<String, Object> params);
    PageUtils queryPageById(Map<String, Object> params);
}

