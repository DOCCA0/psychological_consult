package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.RecordEntity;

import java.util.Map;

/**
 * 来访者的一次咨询的档案
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:05
 */
public interface RecordService extends IService<RecordEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

