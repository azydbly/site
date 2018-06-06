package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.PsnFile;

public interface PsnFileMapper {
	
	// 查询分页数据
	List<PsnFile> showPsnPage(@Param("search") String search, @Param("subSQL") String subSQL);

	// 查询最大档案编码
	int selMaxNum();
		
	// 插入一条记录
	int insPsnFile(PsnFile file);

	// 修改档案，重新上传附件
	int updPsnfile(PsnFile file);
	
	// 修改档案，不重新上传附件
	int updPsnfileNoFile(PsnFile file);	
	
	// 根据id删除档案（逻辑删除）
	int delById(@Param("idlist")List<Integer> idlist);
	
	//起草  真实删除
	int deldteById(@Param("idlist")List<Integer> idlist);
	
	// 审批与驳回
	int updateCheck(int fileId, int checkState);
	
	// 根据id获取档案
	PsnFile selFileById(int id);

	// 删除附件
	int delAttach(int id);

}
