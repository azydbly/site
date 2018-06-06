package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Department;
import com.entity.Role;
import com.entity.Salary;

public interface SalaryMapper {
	
	// 查询全部薪酬管理
	List<Salary> getPageSalaryList(@Param("search") String search, @Param("subSQL") String subSQL);
	
	// 根据用户id查询表
	Salary selSalaryById(int id);

	// 根据id修改用用户
	int updSalaryById(Salary salary);

	// 薪酬发放管理导出Excel
	List<Salary> exportSalary(@Param("idlist")List<Integer> idlist);

	// 通过薪酬标准查询部门
	Department selDepByRoleId(int roleId);

	// 插入用户
	int insertSalary(Salary salary);

	// 根据修改审核状态
	int updSalary(int id,int checkstate);

	// 批量删除
	int deleteAll(@Param("idlist")List<Integer> idlist);

	// 插入用户对应的薪酬时查询所在的部门跟职位
	Role selRole(int roleId);

	// 插入用户对应的薪酬时查询所在的部门跟职位
	Department selDept(int deptId);

	// 通过姓名查找编号
	Salary selId(int id);

	// 查询员工的薪资详情
	Salary selById(int employeeId);
}
