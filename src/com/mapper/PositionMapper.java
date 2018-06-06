package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Department;
import com.entity.Position;
import com.entity.Role;

public interface PositionMapper {

	//显示所有职位
	List<Position> selectPosition();
	
	//显示所有职位
	List<Position> getPagePositionList(@Param("search") String search, @Param("subSQL") String subSQL);

	//通过id查询职位信息
	Position selectPositionById(int id);
	
	int deletePosition(@Param("idlist")List<Integer> idlist);

	List<Role> selectRoleByDepid(String depId);

	List<Department> selectDeptIdAndName();

	int insertPosition(Position position);

	int savePosition(Position position);
	
	Role selRoleById(String roleId);
}
