package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.ResumeManage;
import com.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.ResumeManageMapper;
import com.service.ResumeManageService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;

@Service
public class ResumeManageServiceImpl implements ResumeManageService {

	@Autowired
	ResumeManageMapper resumeManageMapper;

	public ResumeManageMapper getResumeManageMapper() {
		return resumeManageMapper;
	}

	public void setResumeManageMapper(ResumeManageMapper resumeManageMapper) {
		this.resumeManageMapper = resumeManageMapper;
	}


	@Override
	public DataTables getPageResumeList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("rm.adddate desc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<ResumeManage> pageInfo = new PageInfo<ResumeManage>(resumeManageMapper.getPageResumeList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}
	
	@Override
	public Map<String,Object> insertResumeManage(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.insertResumeManage(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	
	@Override
	public Map<String,Object> updChangeStatusToOne(int id,int resumeStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updChangeStatusToOne(id, resumeStatus) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String,Object> updateResumeManage(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updateResumeManage(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Map<String,Object> updateResumeManageNoFile(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updateResumeManageNoFile(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public ResumeManage selectResumeManageById(int id) {
		return resumeManageMapper.selectResumeManageById(id);
	}

	@Override
	public Map<String, Object> deleteSomeResumeManage(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.deleteSomeResumeManage(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updateResumeManageFirst(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updateResumeManageFirst(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updateResumeManageSecond(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updateResumeManageSecond(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updateResumeManageThird(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updateResumeManageThird(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public int removeResumeManage(int id) {
		return resumeManageMapper.removeResumeManage(id);
	}

	@Override
	public Map<String, Object> updateResumeManageResult(ResumeManage resumeManage) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (resumeManageMapper.updateResumeManageResult(resumeManage) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Role selectRoleByRname(String rname) {
		return resumeManageMapper.selectRoleByRname(rname);
	}

	@Override
	public String selectDeptByName(String rname) {
		return resumeManageMapper.selectDeptByName(rname);
	}


}

