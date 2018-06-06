package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Attachment;

public interface AttachmentMapper {
	
	//上传文件
	int insAttachment(Attachment attachment);
	
	//添加文件时验证文件名是否重复
	Attachment selAttByName(String name);
	
	//修改文件时验证文件名是否重复
	Attachment selAttByNameId(int id,String name);
	
	//文件分页显示
	List<Attachment> getPageFileList(@Param("search") String search, @Param("subSQL") String subSQL);
	
}
