package com.shangcheng.psychology.modules.psychology.dao;

import com.shangcheng.psychology.modules.psychology.entity.ClientQuestionEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * client和问题的对应
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:04
 */
@Mapper
public interface ClientQuestionDao extends BaseMapper<ClientQuestionEntity> {
	
}
