package stepDefinition;

import java.net.URL;
import java.util.concurrent.TimeUnit;

import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.remote.DesiredCapabilities;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.api.junit.Cucumber;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;

@RunWith(Cucumber.class)
public class Config_LaunchAppStepDefinition {

	AndroidDriver driver;
	DesiredCapabilities capabilities = new DesiredCapabilities();

	@When("^the user sets configuration for connected device$")
	public void the_user_sets_configuration_for_connected_device() throws Throwable {
		// config device, version, app
		capabilities.setCapability("deviceName", "LRAA99JFSSAYEY79");
		capabilities.setCapability("platformVersion", "5.0.2");
		capabilities.setCapability("platformName", "Android");
		capabilities.setCapability("appPackage", "com.asiam.Inspection");
		capabilities.setCapability("appActivity", "com.asiam.Inspection.activities.SplashActivity");
	}

	@Then("^he launchs app$")
	public void he_launchs_app() throws Throwable {
		// remote appium
		driver = new AndroidDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
		driver.manage().timeouts().implicitlyWait(80, TimeUnit.SECONDS);
	}

	@And("^he goes to Recent location$")
	public void he_goes_to_recent_location() throws Throwable {
		// skip first video
		driver.findElement(By.id("com.asiam.Inspection:id/videoView")).click();
		// click on Recent section
		Dimension screensize = driver.findElement(By.id("android:id/content")).getSize(); // get dimension of screen
		TouchAction action = new TouchAction(driver);
		action.tap((int) (screensize.width * 0.75), screensize.height / 2).perform();
	}

	@And("^he selects first report$")
	public void he_selects_first_report() throws Throwable {
		// open first report
		Thread.sleep(2000);
		driver.findElement(By.xpath("//android.widget.ListView/android.widget.LinearLayout[@index='0']")).click();
		driver.findElement(By.name("Open Report")).click();
	}

}
