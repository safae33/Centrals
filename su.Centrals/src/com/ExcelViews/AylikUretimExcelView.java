package com.ExcelViews;

import java.io.FileInputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.Dao.CentralDao;
import com.Dao.CustomQuerysDao;
import com.Model.Central;


@Component("aylikÜretimRaporuOlustur")
public class AylikUretimExcelView extends AbstractXlsxView  {
	
	@Autowired
	private CustomQuerysDao customQeuryDao;
	
	@Autowired
	private CentralDao centralDao;

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String filename = "AylikUretim.xlsx";
		String[] yilVeAy = getFinalDate((String) model.get("yearMonthSelect"));
		//String[] arr = ((String)model.get("yearMonthSelect")).split("-");
		
		XSSFWorkbook oldWorkbook = new  XSSFWorkbook(new FileInputStream(ResourceUtils.getFile("classpath:AylikUretim.xlsx")));
		WriteUtils.copyXSSFSheets(oldWorkbook, (XSSFWorkbook) workbook);
		Sheet sheet = workbook.getSheetAt(0);
	    sheet.setFitToPage(true);
	    LocalDate date_ = null;
	    Object[] arr;
	    
		List<Central> centrals = centralDao.read().stream().filter(p -> p.getId() != 0 && p.isActive()).collect(Collectors.toList());
	    //(i*4) + 1
	    for(int k = 0; k < centrals.size(); k++) {
	    	sheet.getRow(0).getCell((k*5) + 1).setCellValue(centrals.get(k).getName_());
	    	for(int i = 1; i<32; i++) {
	    		sheet.getRow(i+1).getCell(k*5).setCellValue(yilVeAy[0]+"-"+yilVeAy[1]+"-"+i);
	    		try {
	    			date_ = LocalDate.of(Integer.parseInt(yilVeAy[0]), Integer.parseInt(yilVeAy[1]), i);
	    			System.out.println(date_);
	    			arr = (Object[])customQeuryDao.getDailyWattSumsByCentralId(centrals.get(k).getId(), date_, date_.minus(Period.ofDays(1))).get(0);

	    			sheet.getRow(i+1).getCell((k*5) + 1).setCellValue(((BigDecimal) arr[1]).doubleValue());
	    			sheet.getRow(i+1).getCell((k*5) + 4).setCellValue((float) arr[2]);
	    		}
	    		catch(IndexOutOfBoundsException e) {
	    			sheet.getRow(i+1).getCell((k*5) + 1).setCellValue(0);
	    		}
	    		catch(NullPointerException e) {
	    			sheet.getRow(i+1).getCell((k*5) + 1).setCellValue(0);
	    		}
	    		catch(DateTimeException e) {
	    			sheet.getRow(i+1).getCell((k*5) + 1).setCellValue(0);
	    		}
	    			    		
	    	}
	    	
	    }
	    
	    Row romToDel = null;
	    int syc = 0, size = centrals.size() * 5;
	    while(true) {
	    	try {
	    		for(int i = 0; i<34; i++) {
		    		romToDel = sheet.getRow(i);
		    		romToDel.removeCell(romToDel.getCell((size) + syc));
		    	}
		    	syc++;
	    	}
	    	catch(Exception e){
	    		break;
	    	}
	    	
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
//		sheet.setDefaultRowHeight((short) 300);
//		sheet.setDefaultColumnWidth(10);
		
//		Row row = sheet.createRow(0);
//		Font font = workbook.createFont();
//		font.setBold(true);
//	    Cell cell = row.createCell(0);
//	    cell.setCellValue("Tarih");
//	    makeRowBold(workbook,row);
//
//		sheet.addMergedRegion(new CellRangeAddress(
//		        0, //first row (0-based)
//		        0, //last row  (0-based)
//		        0, //first column (0-based)
//		        1  //last column  (0-based)
//		));
//		CellUtil.setAlignment(cell, HorizontalAlignment.CENTER);
			    
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/ms-excel; charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename*=''" + URLEncoder.encode(filename, "UTF-8"));
	    
	}

	public String[] getFinalDate(String date) {
		String[] arr = date.trim().split("-");
		arr[1] = Integer.toString(Month.valueOf(arr[1].toUpperCase()).getValue());
		return arr;		
	}
	
//	public void makeRowBold(Workbook wb, Row row){
//	    CellStyle style = wb.createCellStyle();//Create style
//	    Font font = wb.createFont();//Create font
//	    font.setBold(true);//Make font bold
//	    style.setFont(font);//set it to bold
//
//	    for(int i = 0; i < row.getLastCellNum(); i++){//For each cell in the row 
//	        row.getCell(i).setCellStyle(style);//Set the style
//	    }
//	}
}
