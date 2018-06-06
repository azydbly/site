package com.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.entity.ResumeManage;
import com.entity.Role;

public interface ResumeManageMapper {

	//分页显示
	List<ResumeManage> getPageResumeList(@Param("search") String search, @Param("subSQL") String subSQL);
	
	//新增简历
	int insertResumeManage(ResumeManage resumeManage);
	
	//改变状态为推荐面试
	int updChangeStatusToOne(int id,int resumeStatus);
	
	//更新简历由附件
	int updateResumeManage(ResumeManage resumeManage);
	
	//更新简历，无附件
	int updateResumeManageNoFile(ResumeManage resumeManage);
	
	//通过id 查询简历
	ResumeManage selectResumeManageById(int id);
	
	//删除简历（单条、多条）
	int deleteSomeResumeManage(@Param("idlist") List<Integer> idlist);

	//一面结果
	int updateResumeManageFirst(ResumeManage resumeManage);

	//二面结果
	int updateResumeManageSecond(ResumeManage resumeManage);

	//三面结果
	int updateResumeManageThird(ResumeManage resumeManage);

	//异步移出简历
	int removeResumeManage(int id);
	
	//录用登记
	int updateResumeManageResult(ResumeManage resumeManage);
	
	Role selectRoleByRname(String rname);

	String selectDeptByName(String rname);
	
}
