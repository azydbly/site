package com.service.impl;

import com.entity.Areas;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.AreasMapper;
import com.service.AreasService;
import com.system.util.DataTables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class AreasServiceImpl implements AreasService {


	@Autowired
	private AreasMapper areasMapper;


	@Override
	public List<Areas> getProvince() {
		return areasMapper.getProvince();
	}

    @Override
    public List<Areas> getCityByProvince(int provinceNumber) {
        return areasMapper.getCityByProvince(provinceNumber);
    }

    @Override
    public List<Areas> getCountyByCity(int pid) {
        return areasMapper.getCountyByCity(pid);
    }

    @Override
    public List<Areas> getTownByCounty(int pid) {
        return areasMapper.getTownByCounty(pid);
    }

    @Override
    public List<Areas> getVillageByTown(int pid) {
        return areasMapper.getVillageByTown(pid);
    }

    @Override
    public DataTables getPageAreasList(DataTables dataTables) {
        PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码
        PageHelper.orderBy("id asc");

        if(!StringUtils.isEmpty(dataTables.getColumn())){
            PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
        }

        PageInfo<Areas> pageInfo = new PageInfo<Areas>(areasMapper.getPageAreasList(dataTables.getSearch(), dataTables.getSubSQL()));
        dataTables.setRecordsTotal(pageInfo.getTotal());
        dataTables.setRecordsFiltered(pageInfo.getTotal());
        dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
        return dataTables;
    }
}
