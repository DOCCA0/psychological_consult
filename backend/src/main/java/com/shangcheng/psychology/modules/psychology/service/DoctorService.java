package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.DoctorEntity;

import java.util.Map;

/**
 * 心理咨询师用户表
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:18
 */
public interface DoctorService extends IService<DoctorEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

