package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 公告面板，发布通知
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:07
 */
@Data
@TableName("announcement")
public class AnnouncementEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 公告id
	 */
	@TableId
	private Integer announcementId;
	/**
	 * 公告标题
	 */
	private String title;
	/**
	 * 公告的内容
	 */
	private String context;
	/**
	 * 公告的创建者id
	 */
	private Long createrId;
	/**
	 * 公告发布时间
	 */
	private Date createTime;
	/**
	 * 0 不显示，1显示
	 */
	private Integer isActive;
	/**
	 * 优先级，实现置顶等功能
	 */
	private Integer priority;




}
