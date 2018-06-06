package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Operation;

public interface OperationMapper {
	
	//插入菜单功能
	int insertOperation(Operation operation);
	
	//根据id查询信息
	Operation selectById(int id);
	
	//删除菜单时，删除功能
	int delByPid(@Param("idlist")List<Integer> idlist);
	
	//根据角色拥有的菜单权限进入页面进行功能控制
	List<Operation> selectByOperationId(List<Integer> idlist);
	
	//通过 pid 查询 信息
	List<Operation> selectByPid(int pid);
}
