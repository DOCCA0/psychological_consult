package com.shangcheng.psychology.modules.psychology.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.common.utils.Query;

import com.shangcheng.psychology.modules.psychology.dao.ClientArchiveDao;
import com.shangcheng.psychology.modules.psychology.entity.ClientArchiveEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientArchiveService;


@Service("clientArchiveService")
public class ClientArchiveServiceImpl extends ServiceImpl<ClientArchiveDao, ClientArchiveEntity> implements ClientArchiveService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ClientArchiveEntity> page = this.page(
                new Query<ClientArchiveEntity>().getPage(params),
                new QueryWrapper<ClientArchiveEntity>()
        );

        return new PageUtils(page);
    }

}