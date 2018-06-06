package com.service;


import com.entity.Attachment;
import com.system.util.DataTables;

public interface AttachmentService {
	
	//上传文件
	int insAttachment(Attachment attachment);
	
	//添加文件时验证文件名是否重复
	Attachment selAttByName(String name);
	
	//修改文件时验证文件名是否重复
	Attachment selAttByNameId(int id,String name);
	
	//文件分页显示
	DataTables getPageFileList(DataTables dataTables);
}
