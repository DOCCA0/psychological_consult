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
 * @date 2021-06-21 14:30:06
 */
@Data
@TableName("archive")
public class ArchiveEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 咨询者的一次完整咨询，一次完整咨询包含多次记录
	 */
	@TableId
	private Integer archivesId;
	/**
	 * 本次咨询的，来访者的id
	 */
	private Long clientId;
	/**
	 * 本次咨询的，咨询师的id
	 */
	private Long doctorId;
	/**
	 * 申请人的主观描述
	 */
	private String clientDescription;
	/**
	 * 医生描述
	 */
	private String doctorDescription;
	/**
	 * 申请时间
	 */
	private Date applyTime;
	/**
	 * -1 失败，0 申请中，1 申请成功，2 结束
	 */
	private Integer status;

}
