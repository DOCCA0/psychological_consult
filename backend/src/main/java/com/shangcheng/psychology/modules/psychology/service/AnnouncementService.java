package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.AnnouncementEntity;

import java.util.Map;

/**
 * 公告面板，发布通知
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:23
 */
public interface AnnouncementService extends IService<AnnouncementEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

