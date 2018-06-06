package com.system.util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.entity.Salary;


/**
 * 导出excel的工具类
 * @author liuchaohe
 *
 */
public class ExcelUtil {
	/**
	 * 薪酬发放导出excel
	 */
	public static void exportExcel(List<Salary> list,OutputStream out){
		//创建excel文档对象
		HSSFWorkbook workbook = new HSSFWorkbook();
		//创建sheet页
		HSSFSheet sheet = workbook.createSheet("员工新薪资表");
		//创建行对象
		HSSFRow row0 = sheet.createRow(0);
		//创建单元格对象
		HSSFCell cell00 = row0.createCell(0);
		cell00.setCellValue("序号");
		HSSFCell cell01 = row0.createCell(1); 
		cell01.setCellValue("部门");
		HSSFCell cell02 = row0.createCell(2); 
		cell02.setCellValue("职位");
		HSSFCell cell03 = row0.createCell(3); 
		cell03.setCellValue("员工姓名");
		HSSFCell cell04 = row0.createCell(4); 
		cell04.setCellValue("工资总额");
		
		//从db中取出
		for (int i = 0; i < list.size(); i++) {
			HSSFRow row = sheet.createRow(i+1);
			HSSFCell cell0 = row.createCell(0);
			cell0.setCellValue(i+1);
			HSSFCell cell1 = row.createCell(1);
			cell1.setCellValue(list.get(i).getDepartment().getFullName());
			HSSFCell cell2 = row.createCell(2);
			cell2.setCellValue(list.get(i).getRole().getName());
			HSSFCell cell3 = row.createCell(3);
			cell3.setCellValue(list.get(i).getEmployee().getUserName());
			HSSFCell cell4 = row.createCell(4);
			cell4.setCellValue(list.get(i).getPayroll());
		}
		try {
			workbook.write(out);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
