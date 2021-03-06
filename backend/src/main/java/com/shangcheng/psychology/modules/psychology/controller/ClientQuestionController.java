package com.shangcheng.psychology.modules.psychology.controller;

import java.util.*;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.segments.MergeSegments;
import com.shangcheng.psychology.modules.sys.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shangcheng.psychology.modules.psychology.entity.ClientQuestionEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientQuestionService;
import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.common.utils.R;



/**
 * client和问题的对应
 *
 * @author WuCao/WangLiHan/DingRuiPeng
 * @email 2947323341@qq.com
 * @date 2021-06-21 14:30:04
 */
@RestController
@RequestMapping("psychology/clientquestion")
public class ClientQuestionController extends AbstractController {
    @Autowired
    private ClientQuestionService clientQuestionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = clientQuestionService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{clientQuestionId}")
    public R info(@PathVariable("clientQuestionId") Long clientQuestionId){
        ClientQuestionEntity clientQuestion = clientQuestionService.getById(clientQuestionId);

        return R.ok().put("clientQuestion", clientQuestion);
    }

    /**
     * 通过clientId查平均分信息
     */
    @RequestMapping("/avg/{clientId}")
    public R getAvgScore(@PathVariable("clientId") Long clientId){
        Double avg = clientQuestionService.getAvgScore(clientId);
        return R.ok().put("avg", avg);
    }

    /**
     * 通过clientIds查平均分信息
     */
    @RequestMapping("/avgs")
    public R getAvgScore(@RequestBody List<Long> clientIds){
        List<Map<Long,Double> > avgs=new ArrayList<Map<Long,Double> >();
        clientIds.stream().forEach(x->{
            Double avg = clientQuestionService.getAvgScore(x);
            HashMap<Long, Double> m = new HashMap<>();
            m.put(x,avg);
            avgs.add(m);
        });
        return R.ok().put("avgs", avgs);
    }

    /**
     * 通过answer获得count信息
     */
    @RequestMapping("/countByAnswer/{answer}")
    public R countByAnswer(@PathVariable("answer") Integer answer){
        int cnt = clientQuestionService.getAnswerCount(answer);
        return R.ok().put("cnt", cnt);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ClientQuestionEntity clientQuestion){
        clientQuestionService.save(clientQuestion);

        return R.ok();
    }


    /**
     * 保存
     */
    @RequestMapping("/saves")
    public R saves(@RequestBody List<ClientQuestionEntity> clientQuestions){
        Long clientId = getClientId();
        for (ClientQuestionEntity clientQuestion:clientQuestions) {
            clientQuestion.setClientId(clientId);
            clientQuestion.setScore(clientQuestion.getHisAnswer()+1);
            clientQuestionService.save(clientQuestion);
        }
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ClientQuestionEntity clientQuestion){
		clientQuestionService.updateById(clientQuestion);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] clientQuestionIds){
		clientQuestionService.removeByIds(Arrays.asList(clientQuestionIds));

        return R.ok();
    }

}
