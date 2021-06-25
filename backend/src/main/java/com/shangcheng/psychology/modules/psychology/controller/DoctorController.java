package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import com.shangcheng.psychology.modules.sys.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.DoctorEntity;
import com.shangcheng.psychology.modules.psychology.service.DoctorService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * 心理咨询师用户表
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:07
 */
@RestController
@RequestMapping("psychology/doctor")
public class DoctorController extends AbstractController {
    @Autowired
    private DoctorService doctorService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = doctorService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{doctorId}")
    public R info(@PathVariable("doctorId") Long doctorId){
		DoctorEntity doctor = doctorService.getById(doctorId);

        return R.ok().put("page", doctor);
    }

    /**
     * 根据token获取doctor信息
     */
    @RequestMapping("/infoByToken")
    public R infoByToken(){
        return R.ok().put("page",getDoctor());
    }



    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DoctorEntity doctor){
		doctorService.save(doctor);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody DoctorEntity doctor){
		doctorService.updateById(doctor);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] doctorIds){
		doctorService.removeByIds(Arrays.asList(doctorIds));

        return R.ok();
    }

}
