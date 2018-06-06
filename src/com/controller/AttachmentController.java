package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.entity.Attachment;
import com.entity.RoleMenu;
import com.service.AttachmentService;
import com.service.MenuService;
import com.service.RoleMenuService;
import com.system.util.DataTables;

@Controller
public class AttachmentController {
	
	private final String prefix = "/WEB-INF/site/upload/";
	
	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "system/file/list";

	//显示文件列表页面
	@RequestMapping("/showFile.action")
	public String selAllLikePage(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showFile.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	
	//分页显示所有文件
	@ResponseBody
	@RequestMapping(value = "/showPageFile.action", produces = "application/json; charset=utf-8")
	public String showPageFile(){
		return JSON.toJSONString(attachmentService.getPageFileList(DataTables.getInstance(request)));
	}
	
	//上传文件
	@RequestMapping("/insFile.action")
	public void insFile(Attachment attachment,MultipartFile file,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取文件名称
		String name = request.getParameter("fileName");
		// 1.得到要上传的路径
		String realPath = request.getServletContext().getRealPath(prefix + "文件管理/" + name);
		File path = new File(realPath);
		// 如果目录不存在，则创建该目录!
		if (!path.exists()) {
			path.mkdirs();
		}
		
		// 2.要上传的文件名字
		String fileName = file.getOriginalFilename();
		// 3.构建要上传的文件IO流
		File f = new File(realPath, fileName);
		// 4.上传文件
		file.transferTo(f);
		
		attachment.setFileUrl(file.getOriginalFilename());
		attachment.setCreateDate(new Date());
		int result = attachmentService.insAttachment(attachment);
		if(result > 0){
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//验证上传文件时名字是否重复
	@RequestMapping("/selAttachmentVerification.action")
	public void selAttachmentYan(HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String fileName = request.getParameter("fileName");
		String id = request.getParameter("id");
		if(id == null){
			Attachment attachment = attachmentService.selAttByName(fileName);
			if(attachment == null){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
		}else{
			Attachment attachment = attachmentService.selAttByNameId(Integer.valueOf(id), fileName);
			if(attachment == null){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
		}
	}
	
}
