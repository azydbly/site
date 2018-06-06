package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Employee;

public interface EmployeeMapper {
	
	//登录系统
	Employee login(String loginName, String loginPassword);

	//更新登录次数
	int updateRegisterById(int id);
	
	//员工分页显示
	List<Employee> getPageEmployeeList(@Param("search") String search, @Param("subSQL") String subSQL);
	
	// 根据id查询用户
	Employee selById(int id);

	// 增加用户
	int insEmployee(Employee employee);

	// 删除用户（单条、多条）
	int delEmployees(@Param("idlist")List<Integer> idlist);

	// 修改用户
	int updEmployee(Employee employee);
	
	//更改自己的密码
	int updatePasswordById(String newPassword, int id);
	
	//修改用户信息添加头像
	int updEmployeeById(Employee employee);

	//通过id查询自己的信息
	Employee selEmpById(int id);

	//通过id更改自己的密码
	String selPasswordById(int id);

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

	//查询该职位下的所有员工数量
	int selectCountRoleName(@Param("idlist")List<Integer> idlist);
	
	//更新员工状态
	int updateEmployeeState(int flag,int employeeNum);
	
	//根据职位id查询所有的员工
	List<Employee> selByRoleId(int roleId);
	
	//更改自己的密码
	int updatePasswordByReset(String newPassword, int employeeNum);
	
	//使用邮箱找回密码
	int updatePasswordByForgot(String loginName,String newPassword);
	
}
