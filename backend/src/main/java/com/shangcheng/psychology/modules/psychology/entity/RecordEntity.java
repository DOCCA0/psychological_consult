package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 来访者的一次咨询的档案
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:05
 */
@Data
@TableName("record")
public class RecordEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 咨询者的一次record，一次完整咨询包含多次record
	 */
	@TableId
	private Integer recordId;
	/**
	 * 
	 */
	private Integer archivesId;
	/**
	 * 医生记录
	 */
	private String doctorDescription;
	/**
	 * 时间
	 */
	private Date datetime;

}
