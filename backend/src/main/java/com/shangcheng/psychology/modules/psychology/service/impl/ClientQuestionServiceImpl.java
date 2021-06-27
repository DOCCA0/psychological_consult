package com.shangcheng.psychology.modules.psychology.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.Query;

import com.shangcheng.psychology.modules.psychology.dao.ClientQuestionDao;
import com.shangcheng.psychology.modules.psychology.entity.ClientQuestionEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientQuestionService;


@Service("clientQuestionService")
public class ClientQuestionServiceImpl extends ServiceImpl<ClientQuestionDao, ClientQuestionEntity> implements ClientQuestionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ClientQuestionEntity> page = this.page(
                new Query<ClientQuestionEntity>().getPage(params),
                new QueryWrapper<ClientQuestionEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public int getAnswerCount(int answer) {
        int cnt = this.count(
                new QueryWrapper<ClientQuestionEntity>().eq("his_answer", answer)
        );
        return cnt;

    }

    @Override
    public double getAvgScore(Long clientId) {
        //求某人的成绩和。
        QueryWrapper<ClientQuestionEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("AVG(score) as avg")
                .eq("client_id", clientId);
        Map<String, Object> map = this.getMap(queryWrapper);
        double avg = Double.parseDouble( map.get("avg").toString());
        return avg;
    }


}