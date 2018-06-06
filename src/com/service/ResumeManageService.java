package com.service;

import java.util.List;
import java.util.Map;

import com.entity.ResumeManage;
import com.entity.Role;
import com.system.util.DataTables;

public interface ResumeManageService {

	//分页显示
	DataTables getPageResumeList(DataTables dataTables);
	
	//新增简历
	Map<String,Object> insertResumeManage(ResumeManage resumeManage);
	
	//改变状态为推荐面试
	Map<String,Object> updChangeStatusToOne(int id,int resumeStatus);
	
	//更新简历，有附件
	Map<String,Object> updateResumeManage(ResumeManage resumeManage);
	
	//更新简历没有附件
	Map<String,Object> updateResumeManageNoFile(ResumeManage resumeManage);
	
	//通过id 查询简历
	ResumeManage selectResumeManageById(int id);
	
	//删除简历（单条、多条）
	Map<String,Object> deleteSomeResumeManage(List<Integer> idlist);
	
	//一面结果
	Map<String,Object> updateResumeManageFirst(ResumeManage resumeManage);

	//二面结果
	Map<String,Object> updateResumeManageSecond(ResumeManage resumeManage);

	//三面结果
	Map<String,Object> updateResumeManageThird(ResumeManage resumeManage);
	
	//异步移出简历
	int removeResumeManage(int id);
	
	//录用结果登记
	Map<String,Object> updateResumeManageResult(ResumeManage resumeManage);

	Role selectRoleByRname(String rname);

	String selectDeptByName(String rname);
	
}
