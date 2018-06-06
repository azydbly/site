package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Employee;
import com.system.util.DataTables;

public interface EmployeeService {
	
	//登录系统
	Employee login(String loginName, String loginPassword);

	//更新登录次数
	int updateRegisterById(int id);

	//员工分页显示
	DataTables getPageEmployeeList(DataTables dataTables);
	
	//更改自己的密码
	int updatePasswordById(String newPassword, int id);
	
	//修改用户信息添加头像
	int updEmployeeById(Employee employee);

	//通过id查询自己的信息
	Employee selEmpById(int id);

	//通过id更改自己的密码
	String selPasswordById(int id);

	// 根据id查询用户
	Employee selById(int id);

	// 增加用户
	Map<String, Object> insEmployee(Employee employee);

	// 删除用户（多条）
	Map<String, Object> delEmployees(List<Integer> idlist);

	// 修改用户
	Map<String, Object> updEmployee(Employee employee);

	// 查询最大用户编码
	int selMaxNum();

	// 添加用户名时异步验证
	Employee selectAllName(String username);
	
	//更新时用户名异步验证
	Employee selectAllNameUpdate(String username,int employeeNum);

	// 根据职位id查询该职位的员工 添加薪资时
	List<Employee> selectRoleName(int roleId);
	
	// 根据职位id查询该职位的员工添加档案时
	List<Employee> selectRoleNameForPsnFile(int roleId);
	
	//更新个人资料不重新上传头像
	int updEmployeeByIdNoFile(Employee employee);
	
	//更新员工状态
	Map<String, Object> updateEmployeeState(int flag,int employeeNum);
	
	//根据职位id查询所有的员工
	List<Employee> selByRoleId(int roleId);
	
	//查询该职位下的所有员工数量
	int selectCountRoleName(List<Integer> idlist);
	
	//更改自己的密码
	Map<String, Object> updatePasswordByReset(String newPassword, int emplpyeeNum);
	
	//使用邮箱找回密码
	int updatePasswordByForgot(String loginName,String newPassword);
	
}
