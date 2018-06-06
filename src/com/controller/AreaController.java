package com.controller;


import com.alibaba.fastjson.JSON;
import com.entity.Areas;
import com.entity.RoleMenu;
import com.google.gson.Gson;
import com.service.AreasService;
import com.service.MenuService;
import com.service.RoleMenuService;
import com.system.util.DataTables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AreaController {

    @Autowired
    HttpServletRequest request;// 请求

    @Autowired
    private MenuService menuService;

    @Autowired
    private RoleMenuService roleMenuService;

    @Autowired
    AreasService areasService;


    public static final String LIST = "system/areas/list";
    public static final String ADD = "system/areas/add";
    public static final String EDIT = "system/areas/edit";


    //选择省份查询城市
    @ResponseBody
    @RequestMapping(value="/ajaxCity.action",produces = "text/html;charset=UTF-8")
    public String ajaxCity(String number){
        List<Areas> list = areasService.getCityByProvince(Integer.valueOf(number));
        Gson gson = new Gson();
        String json = gson.toJson(list);
        return json;
    }

    //选择城市查询区县
    @ResponseBody
    @RequestMapping(value="/ajaxCounty.action",produces = "text/html;charset=UTF-8")
    public String ajaxCounty(String number){
        List<Areas> list = areasService.getCountyByCity(Integer.valueOf(number));
        Gson gson = new Gson();
        String json = gson.toJson(list);
        return json;
    }

    //选择区县查询城镇
    @ResponseBody
    @RequestMapping(value="/ajaxTown.action",produces = "text/html;charset=UTF-8")
    public String ajaxTown(String number){
        List<Areas> list = areasService.getTownByCounty(Integer.valueOf(number));
        Gson gson = new Gson();
        String json = gson.toJson(list);
        return json;
    }

    //选择城镇查询农村
    @ResponseBody
    @RequestMapping(value="/ajaxVillage.action",produces = "text/html;charset=UTF-8")
    public String ajaxVillage(String number){
        List<Areas> list = areasService.getVillageByTown(Integer.valueOf(number));
        Gson gson = new Gson();
        String json = gson.toJson(list);
        return json;
    }

    //进入显示菜单页面
    @RequestMapping("/areasList.action")
    public String selAllLikePage(){
        List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("areasList.action"));
        request.setAttribute("areas", areasService.getProvince());
        request.setAttribute("roleMenuId", roleMenuId);
        return LIST;
    }

    //分页显示所有区域
    @ResponseBody
    @RequestMapping(value = "/showPageAreas.action", produces = "application/json; charset=utf-8")
    public String showPageAreas(){
        return JSON.toJSONString(areasService.getPageAreasList(DataTables.getInstance(request)));
    }



}
