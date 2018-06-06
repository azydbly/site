package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Operation;

public interface OperationService {

	//插入菜单功能
	Map<String, Object> insertOperation(Operation operation);
	
	//根据id查询信息
	Operation selectById(int id);
	
	//删除菜单时，删除功能
	int delByPid(List<Integer> idlist);
	
	//根据角色拥有的菜单权限进入页面进行功能控制
	List<Operation> selectByOperationId(List<Integer> idlist);
	
	//通过 pid 查询 信息
	List<Operation> selectByPid(int pid);
}
