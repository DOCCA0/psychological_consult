package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.ClientQuestionEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientQuestionService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * client和问题的对应
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:04
 */
@RestController
@RequestMapping("psychology/clientquestion")
public class ClientQuestionController {
    @Autowired
    private ClientQuestionService clientQuestionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = clientQuestionService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{clientQuestionId}")
    public R info(@PathVariable("clientQuestionId") Long clientQuestionId){
		ClientQuestionEntity clientQuestion = clientQuestionService.getById(clientQuestionId);

        return R.ok().put("clientQuestion", clientQuestion);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ClientQuestionEntity clientQuestion){
        clientQuestionService.save(clientQuestion);

        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ClientQuestionEntity clientQuestion){
		clientQuestionService.updateById(clientQuestion);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] clientQuestionIds){
		clientQuestionService.removeByIds(Arrays.asList(clientQuestionIds));

        return R.ok();
    }

}
