package com.shangcheng.psychology.modules.psychology.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shangcheng.psychology.common.utils.PageUtils;
import com.shangcheng.psychology.common.utils.Query;

import com.shangcheng.psychology.modules.psychology.dao.MessageBoardDao;
import com.shangcheng.psychology.modules.psychology.entity.MessageBoardEntity;
import com.shangcheng.psychology.modules.psychology.service.MessageBoardService;


@Service("messageBoardService")
public class MessageBoardServiceImpl extends ServiceImpl<MessageBoardDao, MessageBoardEntity> implements MessageBoardService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MessageBoardEntity> page = this.page(
                new Query<MessageBoardEntity>().getPage(params),
                new QueryWrapper<MessageBoardEntity>()
        );

        return new PageUtils(page);
    }

}