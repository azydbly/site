package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Operation;
import com.mapper.OperationMapper;
import com.service.OperationService;
import com.system.util.RequestStatus;

@Service
public class OperationServiceImpl implements OperationService {

	@Autowired
	private OperationMapper operationMapper;


	@Override
	public Map<String, Object> insertOperation(Operation operation) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (operationMapper.insertOperation(operation) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}


	@Override
	public Operation selectById(int id) {
		return operationMapper.selectById(id);
	}


	@Override
	public int delByPid(List<Integer> idlist) {
		return operationMapper.delByPid(idlist);
	}


	@Override
	public List<Operation> selectByOperationId(List<Integer> idlist) {
		return operationMapper.selectByOperationId(idlist);
	}


	@Override
	public List<Operation> selectByPid(int pid) {
		return operationMapper.selectByPid(pid);
	}

}
