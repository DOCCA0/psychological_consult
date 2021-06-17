package com.shangcheng.psychology.modules.psychology.dao;

import com.shangcheng.psychology.modules.psychology.entity.ClientEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 来访者，普通需要咨询的人
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:22
 */
@Mapper
public interface ClientDao extends BaseMapper<ClientEntity> {
	
}
