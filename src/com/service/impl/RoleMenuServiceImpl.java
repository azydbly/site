package com.service.impl;

import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Menu;
import com.entity.RoleMenu;
import com.mapper.MenuMapper;
import com.mapper.RoleMenuMapper;
import com.service.RoleMenuService;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {

	@Autowired
	private RoleMenuMapper rolemenuMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<RoleMenu> selAllByRoleId(int roleId) {
		return rolemenuMapper.selAllByRoleId(roleId);
	}

	@Override
	public String geMenusTreeToJson(int roleid) {
		//第一个参数是： 显示所有的菜单集合   第二个参数  当前的角色id
		return createTreeJson(menuMapper.selAllMenuByZtree(), roleid);
	}
	
	@Override
	public int delRoleMenu(int roleId) {
		return rolemenuMapper.delRoleMenu(roleId);
	}
	
	@Override
	public int insRoleMenu1(int roleId, int menuId) {
		return rolemenuMapper.insRoleMenu1(roleId, menuId);
	}
	
	//创建root
	private String createTreeJson(List<Menu> list,int roleid) {
		JSONArray rootArray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			Menu menu = list.get(i);
			//创建父菜单
			if (menu.getPid() == 0) {
				JSONObject rootObj = createBranch(list, menu,roleid);
				rootArray.add(rootObj);
			}
		}
		return rootArray.toString();
	}
		
	//嵌套循环	
	private JSONObject createBranch(List<Menu> list, Menu currentNode,int roleid) {
		/*
		 * 将javabean对象解析成为JSON对象
		 */
		 JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		 jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		 jsonConfig.setExcludes(new String[]{"roles"});  //过滤不需要转换的类型
   		 JSONObject currentObj = JSONObject.fromObject(currentNode,jsonConfig);//把类型转化成json类型的数据
		 JSONArray childArray = new JSONArray();
		/*
		 * 循环遍历原始数据列表，判断列表中某对象的父id值是否等于当前节点的id值，
		 * 如果相等，进入递归创建新节点的子节点，直至无子节点时，返回节点，并将该
		 * 节点放入当前节点的子节点列表中
		 */
		for (int i = 0; i < list.size(); i++) {
			Menu newNode = list.get(i);
			//显示子菜单名称，放在对应的父菜单下面
			if ((newNode.getPid() != 0) && (newNode.getPid() == currentNode.getId())) {
				JSONObject childObj = createBranch(list, newNode,roleid);
				//根据角色id获取选择的菜单
				List<RoleMenu> rmlist = rolemenuMapper.selAllByRoleId(roleid);
				Iterator<RoleMenu> its = rmlist.iterator();
				//判断序列中是否还有元素
				while (its.hasNext()) { 
					RoleMenu str = its.next();
					//当子菜单在权限表中存在，就把复选框选上
					if(str.getOperationId() == newNode.getId()){
						childObj.put("checked", true);
					}
				}
				childArray.add(childObj);
			}
		}
		
		//判断当前子节点数组是否为空，不为空将子节点数组加入children字段中
		if (!childArray.isEmpty()) {
			currentObj.put("children", childArray);
		}
		return currentObj;
	}

	@Override
	public List<RoleMenu> selectByRoleIdMenuId(int roleId, int menuId) {
		return rolemenuMapper.selectByRoleIdMenuId(roleId, menuId);
	}

	@Override
	public int insRoleMenu(int roleId, int menuId, int operationId) {
		return rolemenuMapper.insRoleMenu(roleId, menuId,operationId);
	}

	@Override
	public int delByMenuId(List<Integer> idlist) {
		return rolemenuMapper.delByMenuId(idlist);
	}

	@Override
	public int delByRoleId(List<Integer> idlist) {
		return rolemenuMapper.delByRoleId(idlist);
	}

}
