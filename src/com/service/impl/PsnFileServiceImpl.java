package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Department;
import com.entity.PsnFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.DepartmentMapper;
import com.mapper.PsnFileMapper;
import com.service.PsnFileService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;
@Service
public class PsnFileServiceImpl implements PsnFileService{
	
	@Autowired
	PsnFileMapper pfMapper;
	
	@Autowired
	DepartmentMapper dpMapper;
	
	public DepartmentMapper getDpMapper() {
		return dpMapper;
	}

	public void setDpMapper(DepartmentMapper dpMapper) {
		this.dpMapper = dpMapper;
	}

	public PsnFileMapper getPfMapper() {
		return pfMapper;
	}

	public void setPfMapper(PsnFileMapper pfMapper) {
		this.pfMapper = pfMapper;
	}

	
	
	
	@Override
	public DataTables showPsnPage(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("CONVERT(department.fullName USING gbk) , CONVERT(role.name USING gbk) , createDate DESC");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<PsnFile> pageInfo = new PageInfo<PsnFile>(pfMapper.showPsnPage(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}
	
	@Override
	public int selMaxNum() {
		return pfMapper.selMaxNum();
	}

	@Override
	public Map<String, Object> insPsnFile(PsnFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pfMapper.insPsnFile(file) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updPsnfile(PsnFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pfMapper.updPsnfile(file) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updPsnfileNoFile(PsnFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pfMapper.updPsnfileNoFile(file) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> delById(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pfMapper.delById(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> deldteById(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pfMapper.deldteById(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updateCheck(int fileId, int checkState) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pfMapper.updateCheck(fileId, checkState) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public List<Department> selAllDep() {
		return dpMapper.selAllDep();
	}
	
	@Override
	public PsnFile selFileById(int id) {
		return pfMapper.selFileById(id);
	}

	@Override
	public int delAttach(int id) {
		return pfMapper.delAttach(id);
	}

	
}
