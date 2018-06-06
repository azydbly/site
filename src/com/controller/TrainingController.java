package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.RoleMenu;
import com.entity.Training;
import com.service.MenuService;
import com.service.RoleMenuService;
import com.service.TrainingService;
import com.system.util.DataTables;

@Controller
public class TrainingController {
    
	@Autowired
	HttpServletRequest request;// 请求
	
	@Resource
	TrainingService trainingService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	private final String prefix = "/WEB-INF/site/upload/";

    public static final String LIST = "train/plan/list";
    public static final String LIST1 = "train/examine/list";
    public static final String LIST2 = "train/feedback/list";
    public static final String ADD = "train/plan/add";
    public static final String EDIT = "train/plan/edit";
    public static final String EDIT1 = "train/examine/edit";
    public static final String EDIT2 = "train/feedback/edit";
    public static final String VIEW = "train/plan/view";

	//进入培训计划页面
    @RequestMapping("/showTrain1.action")
	public String selAllTrain1(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showTrain1.action"));
		request.setAttribute("roleMenuId", roleMenuId);
    	return LIST;
    }
	//进入培训计划页面
	@RequestMapping("/showTrain2.action")
	public String selAllTrain2(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showTrain2.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST1;
		
	}
	//进入培训计划页面
	@RequestMapping("/showTrain3.action")
	public String selAllTrain3(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showTrain3.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST2;
	}
    	
	//分页显示所有培训计划
	@ResponseBody
	@RequestMapping(value = "/showPageTrainPlan.action", produces = "application/json; charset=utf-8")
	public String showPageTrainPlan(int save){
		String subSQL = "";
		if(save == 1){
			if (!StringUtils.isEmpty(request.getParameter("topenions"))) {
				subSQL += "and topenions = " + request.getParameter("topenions");
			}
		}else if(save == 2){
			subSQL += " and topenions = 2";
		}else if(save == 3){
			subSQL += "and topenions = 3";
		}
		
		if (!StringUtils.isEmpty(request.getParameter("timeMin"))) {
			subSQL += " and begintime >= '" + request.getParameter("timeMin") + "'";
		}
		if (!StringUtils.isEmpty(request.getParameter("timeMax"))) {
			subSQL += "and endtime <= '" + request.getParameter("timeMax") + "'";
		}
		return JSON.toJSONString(trainingService.showPageTrainPlan(DataTables.getInstance(request,subSQL)));
	}
    
	
	//新增培训计划异步验证名称是否存在
	@RequestMapping("/trainCkname.action")
	public void trainCkname(HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String tname = request.getParameter("tname");
		String id = request.getParameter("id");
		if(id == null){
			Training training = trainingService.insertCkname(tname);
			if(training == null){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
		}else{
			Training training = trainingService.updateCkname(tname, Integer.valueOf(id));
			if (training == null) {
				response.getWriter().print("true");
			} else {
				response.getWriter().print("false");
			}
		}
	}
	
	//新增培训计划
 	@ResponseBody
	@RequestMapping(value = "/trainAddPlan.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String add(Training train,MultipartFile file,HttpServletRequest request) throws Exception{
		train.setTcreatetime(new Date());
		
		if(!"".equals(request.getParameter("uploadfile"))){
			String tname = request.getParameter("tname");
			// 1.得到要上传的路径
			String realPath = request.getServletContext().getRealPath(prefix + "培训资料/" + tname);
			File path = new File(realPath);
			// 如果目录不存在，则创建该目录!
			if (!path.exists()) {
				path.mkdirs();
			}
			// 2.要上传的文件名字
			String fileName = file.getOriginalFilename();
			String url = tname + "/" +fileName;
			// 3.构建要上传的文件IO流
			File f = new File(realPath, fileName);
			// 4.上传文件
			file.transferTo(f);
			train.setTfiles(fileName);
			train.setUrl(url);
		}
		return JSONObject.toJSONString(trainingService.insertSelective(train));
	}
 	
 	
 	 //跳转更新页  edit
	@RequestMapping("trainGoupdate.action")
	public String goupdate(Model model,Integer id){
		Training train = trainingService.selectByPrimaryKey(id);
		model.addAttribute("train", train);
		return EDIT;
	}
	
	
	//更新计划
	@ResponseBody
	@RequestMapping(value = "/trainUpdaten.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String update(Training train,MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if("是".equals(request.getParameter("radio"))){
			//获取数据库中的信息
			Training old = trainingService.selectByPrimaryKey(train.getId());
			//判断该计划之前有没有文件存在
			if(!"".equals(old.getTfiles()) || old.getTfiles() != null){
				//获取之前的文件名称
				String delname = old.getTfiles();
				//获取之前的计划名称
				String oldTname = old.getTname();
				//得到之前的上传的路径
				String oldRealPath = request.getServletContext().getRealPath(prefix + "培训资料/" + oldTname);
				String oldRealPathJia = request.getServletContext().getRealPath(prefix + "培训资料/");
				
				//删除旧的文件,在删除文件夹
				if(!"".equals(delname) && delname != null){
					File oldf = new File(oldRealPath,delname);//删除旧的文件
					oldf.delete();
					
					File o = new File(oldRealPathJia,oldTname);//删除旧的文件夹
					o.delete();
				}
			}
			if (!"".equals(request.getParameter("uploadfile"))) {
				//获取计划名称
				String tname = request.getParameter("tname");
				// 1.得到要上传的路径
				String realPath = request.getServletContext().getRealPath(prefix + "培训资料/" + tname);
				File path = new File(realPath);
				// 如果目录不存在，则创建该目录!
				if (!path.exists()) {
					path.mkdirs();
				}
				// 2.要上传的文件名字
				String fileName = file.getOriginalFilename();
				String url = tname + "/" + fileName;
				// 3.构建要上传的文件IO流
				File f = new File(realPath, fileName);
				// 4.上传文件
				file.transferTo(f);
				train.setTfiles(fileName);
				train.setUrl(url);
			}
			return JSON.toJSONString(trainingService.updateByPrimaryKeySelective(train));
		}else{
			return JSON.toJSONString(trainingService.updateByPrimaryKeySelectiveNoFile(train));
		}
	}
		
	//查看详情
	@RequestMapping("trainDetial.action")
    public String detial(Model model,Integer id){
		model.addAttribute("train", trainingService.selectByPrimaryKey(id));
		return VIEW;
	}
	
	//计划审批
	@RequestMapping("trainShenPi.action")
	public String trainShenPi(Model model,Integer id){
		model.addAttribute("train", trainingService.selectByPrimaryKey(id));
		return EDIT1;
	}
	
	
	//删除
	@ResponseBody
	@RequestMapping(value = "/trainDelete.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String delete(@RequestParam("idlist[]") List<Integer> idlist){
		return JSON.toJSONString(trainingService.deleteByPrimaryKey(idlist));
	}
	
	
	//提交计划
	@ResponseBody
	@RequestMapping(value = "/updateTrainState.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String updateTrainState(int id,int flag){
		return JSON.toJSONString(trainingService.updateTrainState(id,flag));
	}
	
 	//跳转反馈页面
	@RequestMapping("trainGofankui.action")
	public String gofankui(Integer id,Model model){
		Training train = trainingService.selectByPrimaryKey(id);
		model.addAttribute("train", train);
		return EDIT2;
	}
	
	//更新审核结果
	@ResponseBody
	@RequestMapping(value = "/trainUpdateShenHe.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String trainUpdateShenHe(Training training){
		return JSON.toJSONString(trainingService.updateTrainShenHe(training));
	}
	
	//更新反馈结果
	@ResponseBody
	@RequestMapping(value = "/trainUpdatefankui.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String updatefankui(Training training){
		return JSON.toJSONString(trainingService.updateFeedbackById(training));
	}
	
	//下载附件
	@RequestMapping("/downTrain.action")
	public void downTrain(String url,String tfiles,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName=" + new String(tfiles.getBytes("gb2312"), "ISO8859-1"));
		
		InputStream in = new FileInputStream(request.getServletContext().getRealPath(prefix + "培训资料/" + url));
		//2048指可以存储 2048个字的东西，多了报  溢出  异常
 		byte[] bytes = new byte[2048];
		int len = 0;
		ServletOutputStream out = response.getOutputStream();
		while((len = in.read(bytes)) != -1){
			out.write(bytes,0,len);
		}
		out.flush();
		out.close();
		in.close();
	}
	
	/**
	 * 移出附件
	 */
	@ResponseBody
	@RequestMapping("/removeTrainFuJian.action")
	public int removeAttachment(int id,String tfiles,String tname){
		
		String oldPathName = request.getSession().getServletContext().getRealPath(prefix + "培训资料/" + tname);
		File file = new File(oldPathName,tfiles);
		if(file.exists()){
			file.delete();
		}
		
		String oldPathNameJia = request.getSession().getServletContext().getRealPath(prefix + "培训资料/");
		File oldf = new File(oldPathNameJia,tname);//删除旧的文件夹
		if(oldf.exists()){
			oldf.delete();
		}
		return trainingService.deleteTrainFuJian(id);
	}
 	
	// ----------转化日期格式-----------------
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false
	}
	
}