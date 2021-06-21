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
 * @date 2021-06-21 14:30:06
 */
@Data
@TableName("client")
public class ClientEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 来访者的id主键
	 */
	@TableId
	private Long clientId;
	/**
	 * 
	 */
	private Long userId;
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

}
