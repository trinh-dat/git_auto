package utilities;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtils {

	public static String filePath;
	public static Workbook workbook;
	public static Sheet sheet;
	public static Row row;
	public static Cell cell;

	private static void setWorkBookExcel(String inFilePath) {
		filePath = inFilePath;
		try {
			FileInputStream inputStream = new FileInputStream(filePath);
			switch (FilenameUtils.getExtension(filePath).toLowerCase()) {
			case "xlsx":
				workbook = new XSSFWorkbook(inputStream);
				break;
			case "xls":
				workbook = new XSSFWorkbook(inputStream);
				break;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Set an Excel workbook from based on file path and sheet name.
	 */
	public static void setWorkBook(String filePath, String sheetName) {
		setWorkBookExcel(filePath);
		sheet = workbook.getSheet(sheetName);
	}

	/**
	 * Set an Excel workbook from based on file path and sheet index
	 */
	public static void setWorkBook(String filePath, int sheetIndex) {
		setWorkBookExcel(filePath);
		sheet = workbook.getSheetAt(sheetIndex);
	}

	/**
	 * Read a cell data from Excel file based on the row index and the column
	 * index
	 */
	public static String getCellValue(int rowIndex, int columnIndex) {
		try {
			cell = sheet.getRow(rowIndex).getCell(columnIndex);
			return cell.getStringCellValue();
		} catch (Exception e) {
			return e.toString();
		}
	}

	/**
	 * Write a cell data to Excel file
	 */
	public static void setCellValue(String value, int rowIndex, int columnIndex) {
		row = sheet.getRow(rowIndex);
		cell = row.getCell(columnIndex, row.RETURN_BLANK_AS_NULL);

		if (cell == null) {
			cell = row.createCell(columnIndex);
		}
		cell.setCellValue(value);
	}

	/**
	 * Save as new Excel file
	 */
	public static void saveAs(String filePath) {
		FileOutputStream fileOut;
		try {
			fileOut = new FileOutputStream(filePath);
			workbook.write(fileOut);
			fileOut.flush();
			fileOut.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
	/**
	 * Return the column number for a given work sheet where the header text
	 * contains headerColumnText
	 */
	public static int getColumnIndex(XSSFSheet sheet, String headerColumnText) {
		final int index = 0;
		final XSSFRow headerRow = sheet.getRow(0);
		final Iterator<Cell> cellIterator = headerRow.cellIterator();
		while (cellIterator.hasNext()) {
			final XSSFCell cell = (XSSFCell) cellIterator.next();
			if (cell.getStringCellValue().equalsIgnoreCase(headerColumnText.toLowerCase())) {
				return cell.getColumnIndex();
			}
		}
		return index;
	}

	/**
	 * Get a list of all values from the specified column
	 */
	public static ArrayList<String> getColumnValues(XSSFSheet s, int index) {
		final ArrayList<String> cellValues = new ArrayList<String>();
		final int rowCount = s.getLastRowNum();
		for (int i = 0; i <= rowCount - 1; i++) {
			try {
				String cellValue = s.getRow(i).getCell(index).getStringCellValue();
				cellValues.add(cellValue);
			} catch (Exception e) {
				cellValues.add("");
			}
		}
		return cellValues;
	}

}
