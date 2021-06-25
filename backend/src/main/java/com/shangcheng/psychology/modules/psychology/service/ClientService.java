package com.shangcheng.psychology.modules.psychology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.ClientEntity;

import java.util.Map;

/**
 * 来访者，普通需要咨询的人
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:06
 */
public interface ClientService extends IService<ClientEntity> {

    PageUtils queryPage(Map<String, Object> params);
    PageUtils queryPageById(Map<String, Object> params);

}

