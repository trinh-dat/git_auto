package stepDefinition;

import cucumber.api.java.en.And;
import utilities.ExcelUtils;

public class GetDataFromCSVStepDefinitions {
	
	public static String clientName;
	public static String supplierName;
	public static String PO_No;
	public static String model_Item_No;
	public static String orderQuantity;
	
	@And("^read data from CSV$")
	public void read_data_from_csv() throws Throwable {
		ExcelUtils.setWorkBook(System.getProperty("user.dir") + "\\csv\\quick full run.csv", 0);
		clientName = ExcelUtils.getCellValue(2, 1);
		supplierName = ExcelUtils.getCellValue(3, 1);
		PO_No = ExcelUtils.getCellValue(4, 1);
		model_Item_No = ExcelUtils.getCellValue(5, 1);
		orderQuantity = ExcelUtils.getCellValue(6, 1);
		
		
	}

}
