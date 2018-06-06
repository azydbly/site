package com.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Attachment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.AttachmentMapper;
import com.service.AttachmentService;
import com.system.util.DataTables;
@Service
public class AttachmentServiceImpl implements AttachmentService {
	
	@Autowired
	private AttachmentMapper attachmentMapper;

	
	@Override
	public int insAttachment(Attachment attachment) {
		return attachmentMapper.insAttachment(attachment);
	}


	@Override
	public Attachment selAttByName(String name) {
		return attachmentMapper.selAttByName(name);
	}


	@Override
	public Attachment selAttByNameId(int id, String name) {
		return attachmentMapper.selAttByNameId(id, name);
	}


	@Override
	public DataTables getPageFileList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("createDate");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<Attachment> pageInfo = new PageInfo<Attachment>(attachmentMapper.getPageFileList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	} 

}
