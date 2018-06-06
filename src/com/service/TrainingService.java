package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Training;
import com.system.util.DataTables;

public interface TrainingService {
	
	//培训计划分页显示
	DataTables showPageTrainPlan(DataTables dataTables);
	
	// 新增时 异捕检查名字是否存在
	Training insertCkname(String tname);
	
	// 新增计划
	Map<String, Object> insertSelective(Training train);
	
	//更新时  异捕检查名字是否存在
	Training updateCkname(String tname,int id);
	
	// 更新计划,更新资料
	Map<String, Object> updateByPrimaryKeySelective(Training record);
	
	//更新计划不更新资料
	Map<String, Object> updateByPrimaryKeySelectiveNoFile(Training record);
	
	// 根据ID查询对象
	Training selectByPrimaryKey(Integer id);

	// 删除
	Map<String, Object> deleteByPrimaryKey(List<Integer> idlist);
	
	//提交计划
	Map<String, Object> updateTrainState(int id,int topenions);
		
	// 更新考核与反馈
	Map<String, Object> updateFeedbackById(Training training);
	
	// 更新审核计划
	Map<String, Object> updateTrainShenHe(Training training);
	
	//移出培训资料
	int deleteTrainFuJian(int id);

}
