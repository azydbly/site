package com.service;


import com.entity.Areas;
import com.system.util.DataTables;

import java.util.List;

public interface AreasService {

    //获取省份
    List<Areas> getProvince();

    //根据省份获取城市
    List<Areas> getCityByProvince(int pid);

    //根据城市查询区县
    List<Areas> getCountyByCity(int pid);

    //根据区县查询城镇
    List<Areas> getTownByCounty(int pid);

    //根据城镇查询村庄
    List<Areas> getVillageByTown(int pid);

    //行政区域分页显示
    DataTables getPageAreasList(DataTables dataTables);

}
