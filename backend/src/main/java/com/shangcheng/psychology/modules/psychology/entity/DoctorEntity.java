package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 心理咨询师用户表
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:18
 */
@Data
@TableName("doctor")
public class DoctorEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer doctorId;
	/**
	 * 咨询师登录的普通账户
	 */
	private String doctorName;
	/**
	 * 用于登录的密码
	 */
	private String doctorPwd;
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
	 * 咨询师电话
	 */
	private String phone;
	/**
	 * 咨询师电子邮件
	 */
	private String email;
	/**
	 * 咨询师账户状态  0停用，1激活
	 */
	private Integer isActive;
	/**
	 * 咨询师等级（一级、二级 等）
	 */
	private String level;
	/**
	 * 咨询师擅长方向（家庭、亲密关系，挫折等）
	 */
	private String skill;
	/**
	 * 展示给来访者的 个人照片
	 */
	private String img;
	/**
	 * 咨询师 的咨询地点
	 */
	private String place;

}
