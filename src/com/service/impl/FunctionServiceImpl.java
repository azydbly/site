package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Function;
import com.mapper.FunctionMapper;
import com.service.FunctionService;

@Service
public class FunctionServiceImpl implements FunctionService {

	@Autowired
	private FunctionMapper functionMapper;
	
	
	@Override
	public List<Function> selectAll() {
		return functionMapper.selectAll();
	}

}
