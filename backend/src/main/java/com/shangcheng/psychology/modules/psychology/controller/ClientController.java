package com.shangcheng.psychology.modules.psychology.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.ClientEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * 来访者，普通需要咨询的人
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:06
 */
@RestController
@RequestMapping("psychology/client")
public class ClientController {
    @Autowired
    private ClientService clientService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = clientService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{clientId}")
    public R info(@PathVariable("clientId") Long clientId){
		ClientEntity client = clientService.getById(clientId);

        return R.ok().put("client", client);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ClientEntity client){
		clientService.save(client);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ClientEntity client){
		clientService.updateById(client);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] clientIds){
		clientService.removeByIds(Arrays.asList(clientIds));

        return R.ok();
    }

}
