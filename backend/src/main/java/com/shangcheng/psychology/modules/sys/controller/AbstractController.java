

package com.shangcheng.psychology.modules.sys.controller;

import com.shangcheng.psychology.modules.common.utils.PageUtils;
import com.shangcheng.psychology.modules.psychology.entity.ClientEntity;
import com.shangcheng.psychology.modules.psychology.entity.DoctorEntity;
import com.shangcheng.psychology.modules.psychology.service.ClientService;
import com.shangcheng.psychology.modules.psychology.service.DoctorService;
import com.shangcheng.psychology.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;

/**
 * Controller公共组件
 *
 * @author Mark sunlightcs@gmail.com
 */
public abstract class AbstractController {
	@Autowired
	DoctorService doctorService;
	@Autowired
	ClientService clientService;
	protected Logger logger = LoggerFactory.getLogger(getClass());
	protected SysUserEntity getUser() {
		return (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
	}
	protected PageUtils getDoctor(){
		Long userId = getUserId();
		HashMap<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		PageUtils page = doctorService.queryPageById(params);
		return page;
	}
	protected PageUtils getClient(){
		Long userId = getUserId();
		HashMap<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		PageUtils page = clientService.queryPageById(params);
		return page;
	}
	protected Long getClientId() {
		return ((ClientEntity)getClient().getList().get(0)).getClientId();
	}
	protected Long getUserId() {
		return getUser().getUserId();
	}
	protected Long getDoctorId() {
		return ((DoctorEntity)getDoctor().getList().get(0)).getDoctorId();
	}
}
