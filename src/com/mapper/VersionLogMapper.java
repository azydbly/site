package com.mapper;

import java.util.List;
import java.util.Map;

import com.entity.Menu;
import com.entity.VersionLog;
import org.apache.ibatis.annotations.Param;

/**
 * 类名称： VersionLogMapper.java
 * 类描述： 系统日志表 数据访问接口  
 * @author yanp
 * 时间： 上午10:11:25
 * 
 */
public interface VersionLogMapper{
	
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
	int insertVersionLog(VersionLog versionLog);

	//版本日志分页显示
	List<VersionLog> getPageVersionLogList(@Param("search") String search, @Param("subSQL") String subSQL);

	//删除版本日志
	int delVersionLog(@Param("idlist")List<Integer> idlist);

	//根据id查询版本日志
	VersionLog selectVersionLogById(int id);

	//修改版本日志
	int updateVersion(VersionLog versionLog);

}