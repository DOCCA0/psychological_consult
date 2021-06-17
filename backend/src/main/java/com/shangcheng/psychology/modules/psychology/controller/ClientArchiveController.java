package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.ClientArchiveEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientArchiveService;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.common.utils.R;



/**
 * 来访者的一次咨询的档案
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-10 11:49:20
 */
@RestController
@RequestMapping("psychology/clientarchive")
public class ClientArchiveController {
    @Autowired
    private ClientArchiveService clientArchiveService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = clientArchiveService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{archivesId}")
    public R info(@PathVariable("archivesId") Integer archivesId){
		ClientArchiveEntity clientArchive = clientArchiveService.getById(archivesId);

        return R.ok().put("clientArchive", clientArchive);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ClientArchiveEntity clientArchive){
		clientArchiveService.save(clientArchive);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ClientArchiveEntity clientArchive){
		clientArchiveService.updateById(clientArchive);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] archivesIds){
		clientArchiveService.removeByIds(Arrays.asList(archivesIds));

        return R.ok();
    }

}
