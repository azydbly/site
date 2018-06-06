package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Function;
import com.entity.Menu;
import com.entity.Operation;
import com.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.MenuMapper;
import com.service.FunctionService;
import com.service.MenuService;
import com.service.OperationService;
import com.service.RoleMenuService;
import com.service.RoleService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;


@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private FunctionService functionService;
	
	@Autowired
	private RoleMenuService roleMenuService;
	
	@Autowired
	private OperationService operationService;
	
	@Autowired
	private RoleService roleService;
	
	@Override
	public List<Menu> selectLoginMenus(int roleId) {
		return menuMapper.selectLoginMenus(roleId);
	}
	
	@Override
	public DataTables getPageMenuList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("convert(menuname using gbk) asc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<Menu> pageInfo = new PageInfo<Menu>(menuMapper.getPageMenuList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}
	
	@Override
	public List<Menu> selPid() {
		return menuMapper.selPid();
	}

	@Override
	public Map<String, Object> insertMenu(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> roleid = roleService.selectForAdmin();
		if (menuMapper.insertMenu(menu) > 0) {
			Menu m = selectByMneuName(menu.getMenuname());
			if(menu.getPid() != 0){
				for(Function f : functionService.selectAll()){
					Operation o = new Operation();
					o.setPid(m.getId());
					o.setMenuname(String.valueOf(f.getId()));
					operationService.insertOperation(o);
				}
				for(Operation operation : operationService.selectByPid(m.getId())){
					for(Role role : roleid){
						roleMenuService.insRoleMenu(role.getNumber(), m.getId(), operation.getId());
					}
				}
			}
			for(Role role : roleid){
				roleMenuService.insRoleMenu(role.getNumber(), m.getId(), 0);
			}
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Menu selMenuByAdd(String menuname) {
		return menuMapper.selMenuByAdd(menuname);
	}
	
	@Override
	public Menu selUrlByAdd(String url) {
		return menuMapper.selUrlByAdd(url);
	}
	
	@Override
	public Menu selMenuById(int id) {
		return menuMapper.selMenuById(id);
	}
	
	@Override
	public Map<String, Object> updateMenu(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (menuMapper.updateMenu(menu) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Menu selMenu(String menuname,int id) {
		return menuMapper.selMenu(menuname,id);
	}
	
	@Override
	public Menu selUrl(String url,int id) {
		return menuMapper.selUrl(url,id);
	}
	
	@Override
	public Map<String,Object> updateMenuState(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (menuMapper.updateMenuState(menu) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> delMenu(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(selectCountMenu(idlist) < 1){
			if (menuMapper.delMenu(idlist) > 0) {
				roleMenuService.delByMenuId(idlist);
				operationService.delByPid(idlist);
				map.put("status", RequestStatus.SUCCESS);
			}else{
				map.put("status", RequestStatus.FAIL);
			}
		}else{
			map.put("status", RequestStatus.EXIS);
		}
		return map;
	}
	
	@Override
	public int selectCountMenu(List<Integer> idlist) {
		return menuMapper.selectCountMenu(idlist);
	}
	
	@Override
	public List<Menu> selAllMenu() {
		return menuMapper.selAllMenu();
	}
	

	public MenuMapper getMenuMapper() {
		return menuMapper;
	}
	public void setMenuMapper(MenuMapper menuMapper) {
		this.menuMapper = menuMapper;
	}

	@Override
	public Menu selectByMneuName(String menuname) {
		return menuMapper.selectByMneuName(menuname);
	}

	@Override
	public List<Menu> selAllMenuByZtree() {
		return menuMapper.selAllMenuByZtree();
	}

	@Override
	public int selectForUrl(String url) {
		return menuMapper.selectForUrl(url);
	}
	
}
