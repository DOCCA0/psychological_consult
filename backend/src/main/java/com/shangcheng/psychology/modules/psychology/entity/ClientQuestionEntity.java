package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * client和问题的对应
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:04
 */
@Data
@TableName("client_question")
public class ClientQuestionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long clientQuestionId;
	/**
	 * clien_id
	 */
	private Long clientId;
	/**
	 * 问题id
	 */
	private Long questionId;
	/**
	 * 1 2 3 4分别代表他的答案
	 */
	private Integer hisAnswer;
	/**
	 * 得分
	 */
	private Integer score;

}
