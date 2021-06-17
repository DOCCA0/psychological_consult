package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:16
 */
@Data
@TableName("message")
public class MessageEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer messageId;
	/**
	 * 发送者身份，admin 管理员，doctor 咨询师，client 咨询者
	 */
	private String sender;
	/**
	 * 发送者的id
	 */
	private Integer senderId;
	/**
	 * 发送者名字
	 */
	private String senderName;
	/**
	 * 接受者身份，admin 管理员，doctor 咨询师，client 咨询者
	 */
	private String receiver;
	/**
	 * 接受者id
	 */
	private Integer receiverId;
	/**
	 * 接受者名字
	 */
	private String receiverName;
	/**
	 * 发送时间
	 */
	private Date sendTime;
	/**
	 * 是否已经读过了，0 未读，1 已读
	 */
	private Integer isRead;
	/**
	 * 消息内容
	 */
	private String context;

}
