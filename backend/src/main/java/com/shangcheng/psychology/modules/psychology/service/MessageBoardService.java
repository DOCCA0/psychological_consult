package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.MessageBoardEntity;

import java.util.Map;

/**
 * 
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:15
 */
public interface MessageBoardService extends IService<MessageBoardEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

