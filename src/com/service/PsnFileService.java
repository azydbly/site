package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Department;
import com.entity.PsnFile;
import com.system.util.DataTables;

public interface PsnFileService {
	
	//分页显示
	DataTables showPsnPage(DataTables dataTables);
	
	// 查询最大档案编码
	int selMaxNum();
	
	//新增档案
	Map<String, Object> insPsnFile(PsnFile file);
	
	// 修改档案，重新上传附件
	Map<String, Object> updPsnfile(PsnFile file);
	
	// 修改档案，不重新上传附件
	Map<String, Object> updPsnfileNoFile(PsnFile file);
	
	//逻辑删除
	Map<String, Object> delById(List<Integer> idlist);

	//起草  真实删除
	Map<String, Object> deldteById(List<Integer> idlist);
	
	//审批与驳回
	Map<String, Object> updateCheck(int fileId, int checkState);
	
	//查询部门信息
	List<Department> selAllDep();

	//查看档案
	PsnFile selFileById(int id);

	//移出附件
	int delAttach(int id);
}
