package screens;

import java.util.List;

import org.openqa.selenium.support.FindBy;

import io.appium.java_client.android.AndroidElement;

public class General_Information {
	
	@FindBy(xpath = "android.widget.TextView[@text='Basic Info']")
	private AndroidElement tabBasicInfo;
	@FindBy(xpath = "android.widget.TextView[@text='Factory Info']")
	private AndroidElement tabFactoryInfo;
	@FindBy(xpath = "android.widget.TextView[@text='Reference Photos']")
	private AndroidElement tabReferencePhotos;
	@FindBy(id = "com.asiam.Inspection:id/txtClientName")
	private AndroidElement clientName;
	@FindBy(id = "com.asiam.Inspection:id/txtSupplierName")
	private AndroidElement supplierName;
	@FindBy(id = "com.asiam.Inspection:id/txtSupplierNamePO")
	private AndroidElement PO_No;
	@FindBy(id = "com.asiam.Inspection:id/txtItemNo")
	private AndroidElement model_Item_No;
	@FindBy(id = "com.asiam.Inspection:id/txtOrderQuantity")
	private AndroidElement orderQuantity;
	@FindBy(id = "com.asiam.Inspection:id/ivNext")
	private AndroidElement nextNavigator;
	@FindBy(id = "com.asiam.Inspection:id/txtCompanyName")
	private AndroidElement companyNameTextBox;
	@FindBy(id = "com.asiam.Inspection:id/txtDateFoundation")
	private AndroidElement yearTextBox;
	@FindBy(id = "com.asiam.Inspection:id/txtLocation")
	private AndroidElement locationTextBox;
	@FindBy(id = "com.asiam.Inspection:id/txtTotalNumWorker")
	private AndroidElement numberWorkersTextBox;
	@FindBy(id = "com.asiam.Inspection:id/txtMainProduct")
	private AndroidElement mainProductTextBox;
	@FindBy(id = "com.asiam.Inspection:id/btnOKProduct")
	private AndroidElement doneButton;
	
	/**
	 * Mandatory pictures
	 */
	@FindBy(xpath = "android.widget.TextView[@text='FACTORY BUILDING OUTSIDE VIEW']")
	private AndroidElement outSideViewFactory;
	@FindBy(xpath = "android.widget.TextView[@text='FACTORY NAME']")
	private AndroidElement factoryName;
	@FindBy(xpath = "android.widget.TextView[@text='PRODUCTION LINE']")
	private AndroidElement productionLiney;
	
	/**
	 * Random pictures
	 */
	@FindBy(xpath = "android.widget.GridView[contains(@resource-id, 'gvImageRandom')]/android.widget.FrameLayout/*")
	private List<AndroidElement> listRandomPictures;
	
	
}
