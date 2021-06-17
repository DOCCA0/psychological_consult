package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 来访者，普通需要咨询的人
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:22
 */
@Data
@TableName("client")
public class ClientEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 来访者的id主键
	 */
	@TableId
	private Integer clientId;
	/**
	 * 来访者登录的普通账户
	 */
	private String clientName;
	/**
	 * 来访者登录的密码
	 */
	private String clientPwd;
	/**
	 * 来访者姓名
	 */
	private String name;
	/**
	 * 0女，1男
	 */
	private Integer sex;
	/**
	 * 来访者年龄
	 */
	private Integer age;
	/**
	 * 来访者电话
	 */
	private String phone;
	/**
	 * 来访者电子邮件
	 */
	private String email;
	/**
	 * 来访者账户状态  0停用，1激活
	 */
	private Integer isActive;
	/**
	 * 注册时间
	 */
	private Date regionTime;

}
