package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Department;
import com.entity.Role;
import com.entity.Salary;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.SalaryMapper;
import com.service.SalaryService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;
@Service
public class SalaryServiceImp implements SalaryService{
	
	@Autowired//自动装配
    private SalaryMapper salaryMapper;
	
	public SalaryMapper getSalaryMapper() {
		return salaryMapper;
	}
	public void setSalaryMapper(SalaryMapper salaryMapper) {
		this.salaryMapper = salaryMapper;
	}
	
	@Override
	public Salary selSalaryById(int id) {
		return salaryMapper.selSalaryById(id);
	}
	@Override
	public Map<String, Object> updSalaryById(Salary salary) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (salaryMapper.updSalaryById(salary) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	@Override
	public Department selDepByRoleId(int roleId) {
		return salaryMapper.selDepByRoleId(roleId);
	}
	@Override
	public Map<String, Object> insertSalary(Salary salary) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (salaryMapper.insertSalary(salary) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> updSalary(int id,int checkstate) {	
		Map<String, Object> map = new HashMap<String, Object>();
		if (salaryMapper.updSalary(id, checkstate) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> deleteAll(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (salaryMapper.deleteAll(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public List<Salary> exportSalary(List<Integer> ids){
		return salaryMapper.exportSalary(ids);
	}
	@Override
	public Role selRole(int roleId) {
		return salaryMapper.selRole(roleId);
	}
	@Override
	public Department selDept(int deptId) {
		return salaryMapper.selDept(deptId);
	}
	@Override
	public Salary selId(int id) {
		return salaryMapper.selId(id);
	}
	@Override
	public Salary selById(int employeeId) {
		return salaryMapper.selById(employeeId);
	}
	@Override
	public DataTables getPageSalaryList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("convert(department.fullName using gbk) , convert(role.name using gbk) asc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<Salary> pageInfo = new PageInfo<Salary>(salaryMapper.getPageSalaryList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}
}
