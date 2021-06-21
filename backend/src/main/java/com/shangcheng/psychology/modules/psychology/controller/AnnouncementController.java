package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.AnnouncementEntity;
import com.shangcheng.psychology.modules.psychology.service.AnnouncementService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * 公告面板，发布通知
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:07
 */
@RestController
@RequestMapping("psychology/announcement")
public class AnnouncementController {
    @Autowired
    private AnnouncementService announcementService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = announcementService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{announcementId}")
    public R info(@PathVariable("announcementId") Integer announcementId){
		AnnouncementEntity announcement = announcementService.getById(announcementId);

        return R.ok().put("announcement", announcement);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody AnnouncementEntity announcement){
		announcementService.save(announcement);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody AnnouncementEntity announcement){
		announcementService.updateById(announcement);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] announcementIds){
		announcementService.removeByIds(Arrays.asList(announcementIds));

        return R.ok();
    }

}
