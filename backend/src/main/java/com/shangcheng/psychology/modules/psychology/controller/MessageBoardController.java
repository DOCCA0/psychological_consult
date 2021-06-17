package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.MessageBoardEntity;
import com.shangcheng.psychology.modules.psychology.service.MessageBoardService;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.common.utils.R;



/**
 * 
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:15
 */
@RestController
@RequestMapping("psychology/messageboard")
public class MessageBoardController {
    @Autowired
    private MessageBoardService messageBoardService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = messageBoardService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{boardId}")
    public R info(@PathVariable("boardId") Integer boardId){
		MessageBoardEntity messageBoard = messageBoardService.getById(boardId);

        return R.ok().put("messageBoard", messageBoard);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody MessageBoardEntity messageBoard){
		messageBoardService.save(messageBoard);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody MessageBoardEntity messageBoard){
		messageBoardService.updateById(messageBoard);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] boardIds){
		messageBoardService.removeByIds(Arrays.asList(boardIds));

        return R.ok();
    }

}
