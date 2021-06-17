package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 管理员表
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:11
 */
@Data
@TableName("admin")
public class AdminEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer adminId;
	/**
	 * 用于登录的管理员账户
	 */
	private String adminName;
	/**
	 * 用于登录的密码
	 */
	private String adminPwd;
	/**
	 * 管理员姓名
	 */
	private String name;
	/**
	 * 0女，1男
	 */
	private Integer sex;
	/**
	 * 管理员年龄
	 */
	private Integer age;
	/**
	 * 管理员电话
	 */
	private String phone;
	/**
	 * 管理员电子邮件
	 */
	private String email;
	/**
	 * 管理员账户状态  0停用，1激活
	 */
	private Integer isActive;

}
