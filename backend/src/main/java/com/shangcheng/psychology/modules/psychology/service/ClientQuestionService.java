package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.ClientQuestionEntity;

import java.util.Map;

/**
 * client和问题的对应
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:04
 */
public interface ClientQuestionService extends IService<ClientQuestionEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

