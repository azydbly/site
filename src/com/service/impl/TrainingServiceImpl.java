package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Training;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.TrainingMapper;
import com.service.TrainingService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;

@Service("trainingService")

public class TrainingServiceImpl implements TrainingService {
	
	@Resource(name="trainingMapper")
	TrainingMapper trainingMapper;
	
	
	@Override
	public DataTables showPageTrainPlan(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("tcreatetime asc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<Training> pageInfo = new PageInfo<Training>(trainingMapper.showPageTrainPlan(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}
	
	@Override
	public Map<String, Object> insertSelective(Training train) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.insertSelective(train) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}


	@Override
	public Map<String, Object> updateByPrimaryKeySelective(Training record) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.updateByPrimaryKeySelective(record) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}


	@Override
	public Map<String, Object> updateByPrimaryKeySelectiveNoFile(Training record) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.updateByPrimaryKeySelectiveNoFile(record) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	//根据ID查询对象
	public Training selectByPrimaryKey(Integer id) {
		return trainingMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public Map<String, Object> deleteByPrimaryKey(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.deleteByPrimaryKey(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
	
	
	@Override
	public Map<String, Object> updateTrainState(int id, int topenions) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.updateTrainState(id,topenions) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Training insertCkname(String tname) {
		return trainingMapper.insertCkname(tname);
	}

	@Override
	public Training updateCkname(String tname, int id) {
		return trainingMapper.updateCkname(tname, id);
	}

	@Override
	public Map<String, Object> updateFeedbackById(Training training) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.updateFeedbackById(training) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Map<String, Object> updateTrainShenHe(Training training) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (trainingMapper.updateTrainShenHe(training) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public int deleteTrainFuJian(int id) {
		return trainingMapper.deleteTrainFuJian(id);
	}

}
	