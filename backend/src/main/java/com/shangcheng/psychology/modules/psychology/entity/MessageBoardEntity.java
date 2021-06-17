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
 * @date 2021-06-10 11:49:15
 */
@Data
@TableName("message_board")
public class MessageBoardEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 留言主键id
	 */
	@TableId
	private Integer boardId;
	/**
	 * 留言的内容
	 */
	private String context;
	/**
	 * 留言的创建者id
	 */
	private Integer createrId;
	/**
	 * 留言时间
	 */
	private Date createTime;
	/**
	 * 0 不显示，1显示
	 */
	private Integer isActive;

}
