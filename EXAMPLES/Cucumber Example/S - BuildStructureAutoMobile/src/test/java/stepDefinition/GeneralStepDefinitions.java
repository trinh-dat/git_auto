package stepDefinition;

import org.junit.runner.RunWith;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.junit.Cucumber;
import io.appium.java_client.android.AndroidDriver;

@RunWith(Cucumber.class)
public class GeneralStepDefinitions {
	
	AndroidDriver driver;
	
	@Given("^the user goes to tab Basic info$")
	public void the_user_goes_to_tab_basic_info() throws Throwable {
		throw new PendingException();
	}

	@When("^he fills in Company Name text field$")
	public void he_fills_in_company_name_text_field() throws Throwable {
		throw new PendingException();
	}

	@And("^he fills in Year Foundation text field$")
	public void he_fills_in_year_foundation_text_field() throws Throwable {
		throw new PendingException();
	}

	@And("^he fills in Location text field$")
	public void he_fills_in_location_text_field() throws Throwable {
		throw new PendingException();
	}

	@And("^he fills in Workers Number text field$")
	public void he_fills_in_workers_number_text_field() throws Throwable {
		throw new PendingException();
	}

	@And("^he fills in Main Product text field$")
	public void he_fills_in_main_product_text_field() throws Throwable {
		throw new PendingException();
	}

	@And("^he selects Done button$")
	public void he_selects_done_button() throws Throwable {
		throw new PendingException();
	}

}
