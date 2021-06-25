package com.shangcheng.psychology.modules.psychology.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.Query;

import com.shangcheng.psychology.modules.psychology.dao.ArchiveDao;
import com.shangcheng.psychology.modules.psychology.entity.ArchiveEntity;
import com.shangcheng.psychology.modules.psychology.service.ArchiveService;


@Service("archiveService")
public class ArchiveServiceImpl extends ServiceImpl<ArchiveDao, ArchiveEntity> implements ArchiveService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ArchiveEntity> page = this.page(
                new Query<ArchiveEntity>().getPage(params),
                new QueryWrapper<ArchiveEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageByDocId(Map<String, Object> params) {
        IPage<ArchiveEntity> page = this.page(
                new Query<ArchiveEntity>().getPage(params),
                new QueryWrapper<ArchiveEntity>().eq("doctor_id",params.get("doctorId"))
        );

        return new PageUtils(page);
    }



}