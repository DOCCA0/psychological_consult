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
 * @date 2021-06-10 11:49:20
 */
@Data
@TableName("client_archive")
public class ClientArchiveEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 咨询者的一次咨询记录
	 */
	@TableId
	private Integer archivesId;
	/**
	 * 本次咨询的，来访者的id
	 */
	private Integer clientId;
	/**
	 * 本次咨询的，咨询师的id
	 */
	private Integer doctorId;
	/**
	 * 申请人的主观描述
	 */
	private String clientDescription;
	/**
	 * 申请人做的问卷 内容 
	 */
	private String questionContext;
	/**
	 * 等级分数
	 */
	private Integer level;
	/**
	 * 申请时间
	 */
	private Date applyTime;
	/**
	 * 申请人期望的咨询地点，最终只是一个参考
	 */
	private String expectPlace;
	/**
	 * 申请人期望的咨询时间，最终只是一个参考
	 */
	private String expectTime;
	/**
	 * 咨询开始时间，几月几日几时
	 */
	private Date startDatetime;
	/**
	 * 咨询结束时间，几月几日几时
	 */
	private Date endDatetime;
	/**
	 * 咨询具体地点
	 */
	private String subPlace;
	/**
	 * -1 失败，0 申请中，1 通过申请但未完成，2完成咨询但未完善资料,3全部完成
	 */
	private Integer status;
	/**
	 * 一次咨询的记录文档，命名：日期_来访者id_咨询师id.xxx
	 */
	private String docPath;
	/**
	 * 回访记录内容
	 */
	private String secondQuestionContext;
	/**
	 * 是否回访,0否，1是
	 */
	private Integer isSecondDo;

}
