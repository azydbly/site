package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Department;
import com.entity.Position;
import com.entity.Role;
import com.system.util.DataTables;

public interface PositionService {

	List<Position> selectPosition();
	
	//分页显示所有职位
	DataTables getPagePositionList(DataTables dataTables);

	Position selectPositionById(int id);
	
	Map<String, Object> deletePosition(List<Integer> idlist);

	List<Role> selectRoleByDepid(String depId);

	List<Department> selectDeptIdAndName();

	Map<String, Object> insertPosition(Position position);

	Map<String, Object> savePosition(Position position);
	
	Role selRoleById(String roleId);

}
