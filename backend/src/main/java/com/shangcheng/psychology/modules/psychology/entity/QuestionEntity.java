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
 * @date 2021-06-21 14:30:05
 */
@Data
@TableName("question")
public class QuestionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 一个问卷题目id
	 */
	@TableId
	private Long questionId;
	/**
	 * 题目内容
	 */
	private String context;
	/**
	 * 1 2 3 4分别代表ABCD
	 */
	private Integer answer;
	/**
	 * 满分
	 */
	private Integer fullScore;

}
