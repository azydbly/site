package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.system.util.DataTables;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.entity.Page;
import com.entity.RoleMenu;
import com.entity.VersionLog;
import com.service.MenuService;
import com.service.RoleMenuService;
import com.service.VersionLogService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class VersionLogContrller {

//    private static final Logger LOG = LoggerFactory.getLogger(VersionLogContrller.class);

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private VersionLogService versionLogService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

    public static final String LIST = "system/version/list";
    public static final String LISTFUTURE = "system/version/list_future";
    public static final String ADD = "system/version/add";
    public static final String DELETE = "system/version/delete";
    public static final String EDIT = "system/version/edit";

	//历史版本日志
    @RequestMapping("/showVersionLogList.action")
    public String showVersionLogList() {
        int pageNum = StringUtils.isNumeric(request.getParameter("pageNum")) ? Integer.valueOf(request.getParameter("pageNum")) : 1;
        int pageRows = StringUtils.isNumeric(request.getParameter("pageRows")) ? Integer.valueOf(request.getParameter("pageRows")) : 5;
        String versionNumber = request.getParameter("versionNumber");
        String title = request.getParameter("title");
        String versionAbstract = request.getParameter("versionAbstract");
        Page page = null;
        Map<String,Object> map = new HashMap<String, Object>();
        if(versionNumber == null || "".equals(versionNumber)){
            map.put("versionNumber",null);
        }else{
            map.put("versionNumber",versionNumber);
        }
        if(title == null || "".equals(title)){
            map.put("title",null);
        }else{
            map.put("title","%" + title + "%");
        }
        if(versionAbstract == null || "".equals(versionAbstract)){
            map.put("versionAbstract",null);
        }else{
            map.put("versionAbstract",versionAbstract);
        }
        int totalRows = versionLogService.selTotalRows(map);
        int totalPages = totalRows / 5;
        if(totalRows % 5 != 0){
            totalPages += 1;
        }
        page = new Page(1,pageNum * pageRows,totalRows);
        page.setPageNum(pageNum);
        page.setTotalCount(totalRows);
        page.setTotalPages(totalPages);
        map.put("page", page);
        List<VersionLog> list = versionLogService.listVersionLog(map);
        List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showVersionLogList.action"));
        request.setAttribute("roleMenuId", roleMenuId);
        request.setAttribute("versionLogs", list);
        request.setAttribute("versionNumber", versionLogService.selVesionNumber());
        request.setAttribute("page", page);
        request.setAttribute("number", versionNumber);
        request.setAttribute("title", title);
        request.setAttribute("versionAbstract", versionAbstract);
        return LIST;
    }


	//版本添加 进入页面
	@RequestMapping("/versionLogAdd.action")
	public String versionLogAdd(){
		request.setAttribute("versionNumber", versionLogService.selVesionNumber());
		return ADD;
	}

	//版本添加
	@ResponseBody
	@RequestMapping(value = "/insertVersionLog.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insertVersionLog(VersionLog versionLog,String versionNumber1){
		if(versionNumber1 != null && versionNumber1 != ""){
			versionLog.setVersionNumber(Float.valueOf(versionNumber1));
		}
		return JSONObject.toJSONString(versionLogService.insertVersionLog(versionLog));
	}
	
	
	//版本号验证
	@RequestMapping("/selVersionNumber.action")
	public void selVersionNumber(HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String versionNumber = request.getParameter("versionNumber1");
		if(Float.valueOf(versionNumber) >= versionLogService.selMaxVesionNumber().getVersionNumber()){
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}

    //版本添加 进入页面
    @RequestMapping("/editAndDelete.action")
    public String editAndDelete(){
        request.setAttribute("versionNumber", versionLogService.selVesionNumber());
        return DELETE;
    }

    //分页显示所有版本日志
    @ResponseBody
    @RequestMapping(value = "/showPageVersionLog.action", produces = "application/json; charset=utf-8")
    public String showPageVersionLog(@RequestParam(value="versionAbstract",required=false)String versionAbstract,@RequestParam(value="createTime",required=false)String createTime,@RequestParam(value="versionNumber",required=false)String versionNumber){
	    versionAbstract = StringUtils.isEmpty(versionAbstract) ? "" : ("and a.versionAbstract = '" + versionAbstract + "'");
		createTime = StringUtils.isEmpty(createTime) ? "" : ("and a.createTime >= '" + createTime + " 00:00:00' and a.createTime <= '" + createTime + " 23:59:59'");
        versionNumber = StringUtils.isEmpty(versionNumber) ? "" : ("and a.versionNumber = " + versionNumber);
        return JSON.toJSONString(versionLogService.getPageVersionLogList(DataTables.getInstance(request,versionAbstract,createTime,versionNumber)));
    }

	//删除版本日志
	@ResponseBody
	@RequestMapping(value = "/deleteVersionLog.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteVersionLog(@RequestParam("idlist[]") List<Integer> idlist){
		return JSONObject.toJSONString(versionLogService.delVersionLog(idlist));
	}

    //版本修改进入页面
    @RequestMapping("/edit.action")
    public String edit(int id){
		request.setAttribute("versionNumber", versionLogService.selVesionNumber());
        request.setAttribute("versionLog", versionLogService.selectVersionLogById(id));
        return EDIT;
    }

    //修改版本日志
	@ResponseBody
	@RequestMapping(value = "/updateVersionLog.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public String updateVersionLog(VersionLog versionLog,String versionNumber1){
        if(versionNumber1 != null && versionNumber1 != ""){
            versionLog.setVersionNumber(Float.valueOf(versionNumber1));
        }
        return JSONObject.toJSONString(versionLogService.updateVersion(versionLog));
    }

    //未来规划
    @RequestMapping("/showVersionLogListFuture.action")
    public String showVersionLogListFuture() {
        int pageNum = StringUtils.isNumeric(request.getParameter("pageNum")) ? Integer.valueOf(request.getParameter("pageNum")) : 1;
        int pageRows = StringUtils.isNumeric(request.getParameter("pageRows")) ? Integer.valueOf(request.getParameter("pageRows")) : 5;
        String versionNumber = request.getParameter("versionNumber");
        String title = request.getParameter("title");
        Page page = null;
        Map<String,Object> map = new HashMap<String, Object>();
        if(versionNumber == null || "".equals(versionNumber)){
            map.put("versionNumber",null);
        }else{
            map.put("versionNumber",versionNumber);
        }
        if(title == null || "".equals(title)){
            map.put("title",null);
        }else{
            map.put("title","%" + title + "%");
        }
        int totalRows = versionLogService.selTotalRowsFuture(map);
        int totalPages = totalRows / 5;
        if(totalRows % 5 != 0){
            totalPages += 1;
        }
        page = new Page(1,pageNum * pageRows,totalRows);
        page.setPageNum(pageNum);
        page.setTotalCount(totalRows);
        page.setTotalPages(totalPages);
        map.put("page", page);
        List<VersionLog> list = versionLogService.listVersionLogFuture(map);
        List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showVersionLogList.action"));
        request.setAttribute("roleMenuId", roleMenuId);
        request.setAttribute("versionLogs", list);
        request.setAttribute("versionNumber", versionLogService.selVesionNumber());
        request.setAttribute("page", page);
        request.setAttribute("number", versionNumber);
        request.setAttribute("title", title);
        return LISTFUTURE;
    }
	
}
