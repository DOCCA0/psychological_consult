

package com.shangcheng.psychology.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shangcheng.psychology.modules.job.entity.ScheduleJobLogEntity;
import com.shangcheng.psychology.common.utils.PageUtils;

import java.util.Map;

/**
 * 定时任务日志
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);
	
}
