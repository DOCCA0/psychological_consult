package com.shangcheng.psychology.modules.psychology.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.Query;

import com.shangcheng.psychology.modules.psychology.dao.AnnouncementDao;
import com.shangcheng.psychology.modules.psychology.entity.AnnouncementEntity;
import com.shangcheng.psychology.modules.psychology.service.AnnouncementService;


@Service("announcementService")
public class AnnouncementServiceImpl extends ServiceImpl<AnnouncementDao, AnnouncementEntity> implements AnnouncementService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AnnouncementEntity> page = this.page(
                new Query<AnnouncementEntity>().getPage(params),
                new QueryWrapper<AnnouncementEntity>()
        );

        return new PageUtils(page);
    }

}