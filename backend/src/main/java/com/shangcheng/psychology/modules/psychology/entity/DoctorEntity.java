package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 心理咨询师用户表
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:07
 */
@Data
@TableName("doctor")
public class DoctorEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long doctorId;
	/**
	 * 
	 */
	private Long userId;
	/**
	 * 咨询师姓名
	 */
	private String name;
	/**
	 * 0女，1男
	 */
	private Integer sex;
	/**
	 * 咨询师年龄
	 */
	private Integer age;
	/**
	 * 咨询师等级（一级、二级 等）
	 */
	private String level;
	/**
	 * 咨询师擅长方向（家庭、亲密关系，挫折等）
	 */
	private String skill;
	/**
	 * 头像
	 */
	private String avatar;
	/**
	 * 咨询师 的咨询地点
	 */
	private String place;
	/**
	 * 
	 */
	private String workTime;

}
