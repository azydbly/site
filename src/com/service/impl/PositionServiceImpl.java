package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Department;
import com.entity.Position;
import com.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.PositionMapper;
import com.service.PositionService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;

@Service
public class PositionServiceImpl implements PositionService {
	
	@Autowired
	PositionMapper positionMapper;

	public PositionMapper getPositionMapper() {
		return positionMapper;
	}

	public void setPositionMapper(PositionMapper positionMapper) {
		this.positionMapper = positionMapper;
	}

	//------------------ get set --------------------
	
	@Override
	public List<Position> selectPosition() {
		return positionMapper.selectPosition();
	}

	@Override
	public Position selectPositionById(int id) {
		return positionMapper.selectPositionById(id);
	}

	@Override
	public List<Role> selectRoleByDepid(String depId) {
		return positionMapper.selectRoleByDepid(depId);
	}

	@Override
	public List<Department> selectDeptIdAndName() {
		return positionMapper.selectDeptIdAndName();
	}

	@Override
	public Map<String, Object> insertPosition(Position position) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (positionMapper.insertPosition(position) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> savePosition(Position position) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (positionMapper.savePosition(position) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Role selRoleById(String roleId) {
		return positionMapper.selRoleById(roleId);
	}

	@Override
	public DataTables getPagePositionList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("p.addDate desc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<Position> pageInfo = new PageInfo<Position>(positionMapper.getPagePositionList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}

	@Override
	public Map<String, Object> deletePosition(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (positionMapper.deletePosition(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

}
