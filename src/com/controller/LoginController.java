package com.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Employee;
import com.service.EmployeeService;
import com.system.util.GeneratorValidateCode;
import com.system.util.ImgUtil;
import com.system.util.MD5Util;
import com.system.util.RequestStatus;

@Controller
public class LoginController {
	
	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	private EmployeeService employeeService;

	//登录系统
	@RequestMapping("/login1.action")
	public String login1(String loginName, String loginPassword,String code,HttpSession session) {
		// 从session中获取服务端生成的验证码
		String sessionCode = null;
		if (session.getAttribute("sessionCode") != null) {
			sessionCode = session.getAttribute("sessionCode").toString();
		}
		// 判断客户端输入的验证码和服务端产生验证码是否一致
		if (sessionCode.equalsIgnoreCase(code)) {
			String password = MD5Util.string2MD5(loginPassword);
			Employee employee = employeeService.login(loginName, password);
			if (employee == null) {
				request.setAttribute("meg", "账号或密码错误");
				request.setAttribute("loginName", loginName);
				return "forward:/login1.jsp";
			} else {
				String employeeNum = employee.getEmployeeNum();
				//通过id增加登录次数
				employeeService.updateRegisterById(Integer.valueOf(employeeNum));
				employee.setRoleId(employeeService.selEmpById(Integer.valueOf(employeeNum)).getRoleId());
				session.setAttribute("employee", employee);
				return "forward:/index.action";
			}
		}else {
			request.setAttribute("loginName", loginName);
			request.setAttribute("loginPassword", loginPassword);
			request.setAttribute("codeMessage", "验证码错误");
			return "forward:/login1.jsp";
		}
	}
	
	//登录系统
	@RequestMapping("/login.action")
	public String login(HttpSession session,String loginName, String loginPassword,String code) throws Exception{
		// 从session中获取服务端生成的验证码
		String sessionCode = null;
		if (session.getAttribute("sessionCode") != null) {
			sessionCode = session.getAttribute("sessionCode").toString();
		}
		// 判断客户端输入的验证码和服务端产生验证码是否一致
		if (sessionCode.equalsIgnoreCase(code)) {
			String password = MD5Util.string2MD5(loginPassword);
			Employee employee = employeeService.login(loginName, password);
			if (employee == null) {
				request.setAttribute("messagePassword", "账号或密码错误");
				request.setAttribute("loginName", loginName);
				return "forward:/login.jsp";
			} else {
				String employeeNum = employee.getEmployeeNum();
				//通过id增加登录次数
				employeeService.updateRegisterById(Integer.valueOf(employeeNum));
				employee.setRoleId(employeeService.selEmpById(Integer.valueOf(employeeNum)).getRoleId());
				session.setAttribute("employee", employee);
				return "redirect:/index.action";
			}
		}else {
			request.setAttribute("loginName", loginName);
			request.setAttribute("loginPassword", loginPassword);
			request.setAttribute("messageCode", "验证码错误");
			return "forward:/login.jsp";
		}
	}
	
	
	//显示验证码
	@ResponseBody
	@RequestMapping(value = "/code.action", method = RequestMethod.GET)
	public String getValidateCode(HttpServletResponse response) {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		GeneratorValidateCode instance = new GeneratorValidateCode();

		request.getSession().setAttribute("sessionCode", instance.getCode());

		try {
			instance.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	//显示验证码，第二种方式
	@RequestMapping("/code1.action")
	public void code1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应头信息；告诉浏览器不要使用缓存
		resp.setHeader("Param", "No-cache");
		resp.setHeader("Cache-control", "No-cache");
		// 告诉浏览器当前响应流中数据是那种格式
		resp.setContentType("image/jpeg");
		resp.setDateHeader("Expires", 0);

		// 获取字符串类型的验证码 Alt+shift+R
		String code = ImgUtil.createCode();
		// 将验证码加入session，供登录的Servlet中使用
		req.getSession().setAttribute("sessionCode", code);
		// 创建图片类型的验证码
		BufferedImage image = ImgUtil.createImage(code);
		// 创建字节数组的输出流
		ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		// 将图片数据写到字节数组输出流中
		ImageIO.write(image, "JPEG", byteOut);
		// 将输出流中的图片数据转换成字节数组
		byte[] buffer = byteOut.toByteArray();
		// 获取响应的输出流
		OutputStream out = resp.getOutputStream();
		out.write(buffer);
		out.flush();
		out.close();
	}

	
	// 通过id查询密码
	@RequestMapping("/selPasswordById.action")
	public void selPasswordById(HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String oldpassword = request.getParameter("oldpassword");
		String employeeNum = request.getParameter("employeeNum");
		String Password = employeeService.selPasswordById(Integer.valueOf(employeeNum));
		if (Password.equals(MD5Util.string2MD5(oldpassword))) {
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//更该个人信息（资料，密码，头像）
	@RequestMapping("/updEmployeeById.action")
	public void updatePasswordById(Employee employe,int employeeNum, String newPassword,MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String prefix = "/WEB-INF/site/";
		
		Employee e = (Employee)request.getSession().getAttribute("employee");
		
		//更改密码
		if(!"".equals(newPassword) && "".equals(request.getParameter("uploadfile")) && e.getLoginName().equals(employe.getLoginName()) && e.getPhone().equals(employe.getPhone()) && e.getTelphone().equals(employe.getTelphone()) && e.getEmail().equals(employe.getEmail())){
			employeeService.updatePasswordById(MD5Util.string2MD5(newPassword), employeeNum);
			// 销毁session
			request.getSession().invalidate();
			response.getWriter().print("passwordtrue");
		//更改个人信息
		}else if("".equals(request.getParameter("uploadfile")) && "".equals(newPassword) && (!e.getLoginName().equals(employe.getLoginName()) || !e.getPhone().equals(employe.getPhone()) || !e.getTelphone().equals(employe.getTelphone()) || !e.getEmail().equals(employe.getEmail()) || !employe.getRemark().equals(e.getRemark()))){
			employeeService.updEmployeeByIdNoFile(employe);
			Employee employee = employeeService.selEmpById(Integer.valueOf(employe.getEmployeeNum()));
			request.getSession().setAttribute("employee", employee);
			response.getWriter().print("true");
		//更改头像
		}else if(!"".equals(request.getParameter("uploadfile")) && "".equals(newPassword) && e.getLoginName().equals(employe.getLoginName()) && e.getPhone().equals(employe.getPhone()) && e.getTelphone().equals(employe.getTelphone()) && e.getEmail().equals(employe.getEmail())){
			//旧的头像名称
			String url = employeeService.selById(Integer.valueOf(((Employee) request.getSession().getAttribute("employee")).getEmployeeNum())).getUrl();
			if(!"".equals(url) || url != null){
				String oldPathName = request.getSession().getServletContext().getRealPath(prefix + "upload/头像");
				if("" != url && url != null){
					File oldf = new File(oldPathName,url);//删除旧的头像
					oldf.delete();
				}
			}
			//判断上传的头像是否为空
			if (!"".equals(request.getParameter("uploadfile"))) {
				//上传路径
				String pathName = request.getSession().getServletContext().getRealPath(prefix + "upload/头像");
				File path = new File(pathName);
				// 如果目录不存在，则创建该目录!
				if (!path.exists()) {
					path.mkdirs();
				}
				String fileName = UUID.randomUUID().toString() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				// 创建新文件的对象
				File newFile = new File(path, fileName);
				file.transferTo(newFile);
				
				employe.setUrl(fileName);
			}
			employeeService.updEmployeeById(employe);
			Employee employee = employeeService.selEmpById(Integer.valueOf(employe.getEmployeeNum()));
			String photo = prefix + "upload/头像/" +  employee.getUrl();
			request.getSession().setAttribute("employee", employee);
			request.getSession().setAttribute("photo", photo);
			
			response.getWriter().print("true");
		}else if("".equals(request.getParameter("uploadfile")) && "".equals(newPassword) && e.getLoginName().equals(employe.getLoginName()) && e.getPhone().equals(employe.getPhone()) && e.getTelphone().equals(employe.getTelphone()) && e.getEmail().equals(employe.getEmail()) && e.getRemark().equals(employe.getRemark())){
			response.getWriter().print("no");
		}else{
			response.getWriter().print("false");
		}
	}

	// 退出系统
	@RequestMapping("/quit.action")
	public void quit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 销毁session
		request.getSession().invalidate();
		response.getWriter().print("true");
	}
	
	
	@RequestMapping("/lock.action")
	public Map<String, Object> lock(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("=======================");
		Employee e = (Employee)request.getSession().getAttribute("employee");
		Employee a = employeeService.selEmpById(Integer.valueOf(e.getEmployeeNum()));
		System.out.println("------------------" + request.getParameter("lockPwd"));
		if(a.getLoginPassword().equals(MD5Util.string2MD5(request.getParameter("lockPwd")))){
			System.out.println("121515");
			map.put("status", RequestStatus.SUCCESS);
		}else{
			System.out.println("DASDSAD");
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}


}
