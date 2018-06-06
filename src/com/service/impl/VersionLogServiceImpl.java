package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.entity.Menu;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.util.DataTables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.VersionLog;
import com.mapper.VersionLogMapper;
import com.service.VersionLogService;
import com.system.util.RequestStatus;
import org.springframework.util.StringUtils;


@Service
public class VersionLogServiceImpl implements VersionLogService {
	
	@Autowired
	private VersionLogMapper versiongLoMapper;

	public VersionLogMapper getVersiongLoMapper() {
		return versiongLoMapper;
	}

	public void setVersiongLoMapper(VersionLogMapper versiongLoMapper) {
		this.versiongLoMapper = versiongLoMapper;
	}


	@Override
	public List<VersionLog> listVersionLog(Map<String, Object> map) {
		return versiongLoMapper.listVersionLog(map);
	}

	@Override
	public int selTotalRows(Map<String, Object> map) {
		return versiongLoMapper.selTotalRows(map);
	}

	@Override
	public List<VersionLog> listVersionLogFuture(Map<String, Object> map) {
		return versiongLoMapper.listVersionLogFuture(map);
	}

	@Override
	public int selTotalRowsFuture(Map<String, Object> map) {
		return versiongLoMapper.selTotalRowsFuture(map);
	}

	@Override
	public List<VersionLog> selVesionNumber() {
		return versiongLoMapper.selVesionNumber();
	}

	@Override
	public VersionLog selMaxVesionNumber() {
		return versiongLoMapper.selMaxVesionNumber();
	}

	@Override
	public Map<String, Object> insertVersionLog(VersionLog versionLog) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(versiongLoMapper.insertVersionLog(versionLog) > 0){
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public DataTables getPageVersionLogList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码
		PageHelper.orderBy("createTime desc");

		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}

		PageInfo<VersionLog> pageInfo = new PageInfo<VersionLog>(versiongLoMapper.getPageVersionLogList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}

	@Override
	public Map<String, Object> delVersionLog(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (versiongLoMapper.delVersionLog(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public VersionLog selectVersionLogById(int id) {
		return versiongLoMapper.selectVersionLogById(id);
	}

	@Override
	public Map<String, Object> updateVersion(VersionLog VersionLog) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (versiongLoMapper.updateVersion(VersionLog) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

}
