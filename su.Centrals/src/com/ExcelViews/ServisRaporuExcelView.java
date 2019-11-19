package com.ExcelViews;


import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.Model.FaultReport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;


@Component("servisRaporuOlustur")
public class ServisRaporuExcelView extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		FaultReport faultReport = (FaultReport) model.get("faultReport");
		
		String filename = "ServisFormu.xlsx";

		XSSFWorkbook oldWorkbook = new  XSSFWorkbook(new FileInputStream(ResourceUtils.getFile("classpath:ServisFormu.xlsx")));
		WriteUtils.copyXSSFSheets(oldWorkbook, (XSSFWorkbook) workbook);
		Sheet sheet = workbook.getSheetAt(0);
	    sheet.setFitToPage(true);
	    
	    String[] matn = faultReport.getMatn();
	    String[] matqua = faultReport.getMatqua();
	    String[] matexp = faultReport.getMatexp();
	    
	    
	    Row row = sheet.getRow(0);
	    row.getCell(0).setCellValue("Tarih: " + faultReport.getCloseDate());

	    row = sheet.getRow(9);
	    row.getCell(2).setCellValue(faultReport.getCentralName() + " " + faultReport.getDeviceName());

	    row = sheet.getRow(11);
	    row.getCell(2).setCellValue(faultReport.getFaultType());
	    	   	    
	    row = sheet.getRow(14);
	    row.getCell(0).setCellValue(faultReport.getSituatedFaults());
	    
	    row = sheet.getRow(23);
	    row.getCell(0).setCellValue(faultReport.getFixingWays());
	    
	    for(int i = 0; i<matn.length; i++) {
	    	row = sheet.getRow(31+(2*i));
		    row.getCell(0).setCellValue(matn[i]);
		    row.getCell(3).setCellValue(matqua[i]);
		    row.getCell(4).setCellValue(matexp[i]);
	    }
	    	    
	    row = sheet.getRow(42);
	    row.getCell(0).setCellValue(faultReport.getTechNameSurname());
	    
	    row = sheet.getRow(49);
	    row.getCell(0).setCellValue(faultReport.getResult());
	    
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/ms-excel; charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename*=''" + URLEncoder.encode(filename, "UTF-8"));

	}
}
