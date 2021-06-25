package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import com.shangcheng.psychology.modules.psychology.entity.DoctorEntity;
import com.shangcheng.psychology.modules.psychology.service.DoctorService;
import com.shangcheng.psychology.modules.sys.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.ArchiveEntity;
import com.shangcheng.psychology.modules.psychology.service.ArchiveService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * 来访者的一次咨询的档案
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:06
 */
@RestController
@RequestMapping("psychology/archive")
public class ArchiveController extends AbstractController {
    @Autowired
    private ArchiveService archiveService;
    @Autowired
    private DoctorService doctorService;
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = archiveService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 通过doctorid获取archive
     */
    @RequestMapping("/info")
    public R infoByDocId(@RequestParam Map<String, Object> params){
        PageUtils page = archiveService.queryPageByDocId(params);

        return R.ok().put("page", page);
    }

    /**
     * 通过上下文获取archive
     */
    @RequestMapping("/infoByToken")
    public R infoByToken(@RequestParam Map<String, Object> params){
        Long doctorId = getDoctorId();
        params.put("doctorId",doctorId);
        return infoByDocId(params);
    }

    /**
     * 信息
     */
//    @RequestMapping("/info/{archivesId}")
//    public R info(@PathVariable("archivesId") Integer archivesId){
//		ArchiveEntity archive = archiveService.getById(archivesId);
//
//        return R.ok().put("archive", archive);
//    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ArchiveEntity archive){
		archiveService.save(archive);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ArchiveEntity archive){
		archiveService.updateById(archive);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] archivesIds){
		archiveService.removeByIds(Arrays.asList(archivesIds));

        return R.ok();
    }

}
