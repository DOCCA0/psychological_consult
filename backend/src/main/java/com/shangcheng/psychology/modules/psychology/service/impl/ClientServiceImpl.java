package com.shangcheng.psychology.modules.psychology.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.Query;

import com.shangcheng.psychology.modules.psychology.dao.ClientDao;
import com.shangcheng.psychology.modules.psychology.entity.ClientEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientService;


@Service("clientService")
public class ClientServiceImpl extends ServiceImpl<ClientDao, ClientEntity> implements ClientService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ClientEntity> page = this.page(
                new Query<ClientEntity>().getPage(params),
                new QueryWrapper<ClientEntity>()
        );

        return new PageUtils(page);
    }

}