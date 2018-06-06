package com.service;

import java.util.List;
import java.util.Map;

import com.entity.VersionLog;
import com.system.util.DataTables;

/**
 * 类名称： VersionLogMapper.java
 * 类描述： 系统日志表 数据访问接口  
 * @author yanp
 * 时间： 上午10:11:25
 * 
 */
public interface VersionLogService{
	
	//显示历史版本日志
	List<VersionLog> listVersionLog(Map<String, Object> map);
	
	//查询历史版本总行数
	int selTotalRows(Map<String, Object> map);

	//显示未来版本日志
	List<VersionLog> listVersionLogFuture(Map<String, Object> map);

	//查询未来版本总行数
	int selTotalRowsFuture(Map<String, Object> map);

	//查询所有的版本号
	List<VersionLog> selVesionNumber();
	
	//查询最大的版本号
	VersionLog selMaxVesionNumber();
	
	//插入版本日志
	Map<String, Object> insertVersionLog(VersionLog versionLog);

	//日志分页显示
	DataTables getPageVersionLogList(DataTables dataTables);

	//删除版本日志
	Map<String, Object> delVersionLog(List<Integer> idlist);

	//根据id查询版本日志
	VersionLog selectVersionLogById(int id);

	//更新版本日志
    Map<String, Object> updateVersion(VersionLog VersionLog);

}