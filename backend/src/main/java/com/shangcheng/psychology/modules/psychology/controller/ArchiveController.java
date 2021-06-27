package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.shangcheng.psychology.modules.psychology.entity.DoctorEntity;
import com.shangcheng.psychology.modules.psychology.service.DoctorService;
import com.shangcheng.psychology.modules.sys.controller.AbstractController;
import org.joda.time.DateTime;
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
     * 通过doctorid或者clientID获取archive
     */
    @RequestMapping("/info")
    public R infoById(@RequestParam Map<String, Object> params){
        PageUtils page = archiveService.queryPageById(params);
        return R.ok().put("page", page);
    }



    /**
     * 通过上下文获取archive
     */
    @RequestMapping("/infoByToken")
    public R infoByToken(@RequestParam Map<String, Object> params){
        Long doctorId = getDoctorId();
        Long clientId = getClientId();
        if (!doctorId.equals(null)) {
            params.put("doctorId", doctorId);
        }else{
            params.put("clientId", clientId);
        }
        return infoById(params);
    }




    /**
     * archiveId获取archive
     */
    @RequestMapping("/infoByArchivesId/{archivesId}")
    public R infoByArchivesId(@PathVariable("archivesId") Integer archivesId){
		ArchiveEntity archive = archiveService.getById(archivesId);
        return R.ok().put("archive", archive);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ArchiveEntity archive){
        System.out.println(archive.toString());
        archive.setClientId(getClientId());
        Date date = new Date();
        archive.setApplyTime(date);
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
