package com.shangcheng.psychology.modules.psychology.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 
 * 
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:13
 */
@Data
@TableName("question")
public class QuestionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 一个问卷题目id
	 */
	@TableId
	private Integer questionId;
	/**
	 * 题目题号，按照题号排列题目
	 */
	private Integer questionNum;
	/**
	 * 题目内容
	 */
	private String context;
	/**
	 * 回答是的分值
	 */
	private Integer answerYesScore;
	/**
	 * 回答否的分值
	 */
	private Integer answerNoScore;

}
