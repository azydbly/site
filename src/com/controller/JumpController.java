package com.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Employee;
import com.service.EmployeeService;
import com.system.email.MailSender;
import com.system.email.Util;
import com.system.util.MD5Util;
import com.system.util.RequestStatus;

@Controller
public class JumpController {
	
	@Autowired
	private EmployeeService employeeService;
	
	//显示主页
	@RequestMapping("/welcome.action")
	public String welcome(){
		return "welcome";		
	}
	
	//个人信息
	@RequestMapping("/personal.action")
	public String personal(){
		return "personalInformation";		
	}
	
	//培训计划添加
	@RequestMapping("/trainListAdd.action")
	public String trainListAdd(){
		return "train/plan/add";	
	}
	
	//显示头像（这个方法有问题，你可以在研究下）
	/*@RequestMapping("/showFaces1.action")
	public String showFaces(HttpSession session,HttpServletRequest request){
		return "forward:WEB-INF/site/upload/头像/" + ((Employee) session.getAttribute("employee")).getUrl();
	}*/
	
	//显示头像
	@RequestMapping("/showFaces.action")
	protected void service(HttpServletRequest request,HttpSession session, HttpServletResponse response) throws ServletException, IOException { 
	    OutputStream os = response.getOutputStream(); 
	    ServletContext sc = request.getSession().getServletContext();   
	    //显示服务器上的图片需要获取在磁盘上的绝对路径
	    File file = new File(sc.getRealPath("/") + "WEB-INF/site/upload/头像/" + ((Employee) session.getAttribute("employee")).getUrl()); 
	    FileInputStream fips = new FileInputStream(file); 
	    byte[] btImg = readStream(fips); 
	    os.write(btImg); 
	    os.flush(); 
	} 
	    
	  /** 
	   * 读取管道中的流数据 
	   */
	public byte[] readStream(InputStream inStream) { 
	    ByteArrayOutputStream bops = new ByteArrayOutputStream(); 
	    int data = -1; 
	    try { 
	      while((data = inStream.read()) != -1){ 
	        bops.write(data); 
	      } 
	      return bops.toByteArray(); 
	    }catch(Exception e){ 
	      return null; 
	    } 
	} 
	
	
	//上传文件
	@RequestMapping("/uploadFile.action")
	public String sessionNull(HttpSession session){
		return "system/file/add";	
	}
	
	//消息列表
	@RequestMapping("/message.action")
	public String message(HttpSession session){
		return "message";	
	}
	
	
	//找回密码
	@RequestMapping("/forgotPassword.action")
	public String forgotPassword(){
		return "forgot-password";	
	}
	
	
	//发送邮件
	@ResponseBody 
	@RequestMapping("getEmail.action")
	public Map<String, Object> getEmail1(HttpServletRequest request) throws IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		String email = request.getParameter("email");
		String loginName = request.getParameter("loginName");
		String password="";
		password = Util.getUUId().substring(0, 6);
		
		int result = employeeService.updatePasswordByForgot(loginName, MD5Util.string2MD5(password));
		if(result > 0){
			boolean flag = MailSender.send(email, "找回密码", String.format("密码已重置，新密码为%s,重新登录后请及时修改您的登录密码! ", password));
			if(flag){
				map.put("status", RequestStatus.SUCCESS);
			}else{
				map.put("status", RequestStatus.FAIL);
			}
		}else{
			map.put("status", RequestStatus.FAIL);
			
		}
		return map;
	}

	//杂七杂八
	@RequestMapping("/mixed.action")
	public String mixed(){
		return "mixed/index";
	}
	
}
