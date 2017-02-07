package app.inspection.tests;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
		features = "src/test/java/features",
		format = { "pretty","html: cucumber-html-reports",
        			"json: cucumber-html-reports/cucumber.json" }
		,glue={"stepDefinition"}
		)
public class TestRunner {

}
