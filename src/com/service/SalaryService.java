package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Department;
import com.entity.Role;
import com.entity.Salary;
import com.system.util.DataTables;

public interface SalaryService {
	
	// 查询全部薪酬管理
	DataTables getPageSalaryList(DataTables dataTables);
	
	// 根据用户id查询表
	Salary selSalaryById(int id);

	// 根据id修改薪资
	Map<String, Object> updSalaryById(Salary salary);

	// 薪酬发放管理导出Excel
	List<Salary> exportSalary(List<Integer> idlist);

	// 通过薪酬标准查询部门
	Department selDepByRoleId(int roleId);

	// 插入薪资
	Map<String, Object> insertSalary(Salary salary);

	// 根据修改审核状态
	Map<String, Object> updSalary(int id,int checkstate);

	// 批量删除
	Map<String, Object> deleteAll(List<Integer> idlist);

	// 插入用户对应的薪酬时查询所在的部门跟职位
	public Role selRole(int roleId);

	// 插入用户对应的薪酬时查询所在的部门跟职位
	Department selDept(int deptId);

	// 通过姓名查找编号
	Salary selId(int id);

	// 查询员工的薪资详情
	Salary selById(int employeeId);
}
