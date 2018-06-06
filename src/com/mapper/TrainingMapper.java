package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Training;

public interface TrainingMapper {
	
	//培训计划分页显示
	List<Training> showPageTrainPlan(@Param("search") String search, @Param("subSQL") String subSQL);
	
	// 新增时 异捕检查名字是否存在
	Training insertCkname(String tname);
	
	// 新增计划
	int insertSelective(Training record);
	
	// 异捕检查名字是否存在
	Training updateCkname(String tname,int id);
		
	// 更新计划,更新资料
	int updateByPrimaryKeySelective(Training record);
	
	//更新计划不更新资料
	int updateByPrimaryKeySelectiveNoFile(Training record);
	
	// 删除计划
	int deleteByPrimaryKey(@Param("idlist")List<Integer> idlist);

	// 通过id查找计划
	Training selectByPrimaryKey(Integer id);
	
	//提交计划
	int updateTrainState(int id,int topenions);
	
	//更新审核结果
	int updateTrainShenHe(Training training);
	
	// 更新考核与反馈
	int updateFeedbackById(Training training);
	
	//移出培训资料
	int deleteTrainFuJian(int id);

}
