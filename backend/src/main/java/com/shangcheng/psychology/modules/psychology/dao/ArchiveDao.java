package com.shangcheng.psychology.modules.psychology.dao;

import com.shangcheng.psychology.modules.psychology.entity.ArchiveEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 来访者的一次咨询的档案
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:06
 */
@Mapper
public interface ArchiveDao extends BaseMapper<ArchiveEntity> {
	
}
