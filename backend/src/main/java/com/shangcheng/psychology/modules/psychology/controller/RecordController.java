package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.RecordEntity;
import com.shangcheng.psychology.modules.psychology.service.RecordService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * 来访者的一次咨询的档案
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:05
 */
@RestController
@RequestMapping("psychology/record")
public class RecordController {
    @Autowired
    private RecordService recordService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = recordService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{recordId}")
    public R info(@PathVariable("recordId") Integer recordId){
		RecordEntity record = recordService.getById(recordId);

        return R.ok().put("record", record);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody RecordEntity record){
		recordService.save(record);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody RecordEntity record){
		recordService.updateById(record);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] recordIds){
		recordService.removeByIds(Arrays.asList(recordIds));

        return R.ok();
    }

}
