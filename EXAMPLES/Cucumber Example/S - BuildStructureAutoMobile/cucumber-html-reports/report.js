$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("Config\u0026LaunchApp.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: dat@inspectorio.com"
    }
  ],
  "line": 3,
  "name": "Config and launch app",
  "description": "",
  "id": "config-and-launch-app",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Open app and report",
  "description": "",
  "id": "config-and-launch-app;open-app-and-report",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "the user sets configuration for connected device",
  "keyword": "When "
});
formatter.step({
  "line": 7,
  "name": "he launchs app",
  "keyword": "Then "
});
formatter.step({
  "line": 8,
  "name": "he goes to Recent location",
  "keyword": "And "
});
formatter.step({
  "line": 9,
  "name": "he selects first report",
  "keyword": "And "
});
formatter.match({
  "location": "Config_LaunchAppStepDefinition.the_user_sets_configuration_for_connected_device()"
});
formatter.result({
  "duration": 352163515,
  "status": "passed"
});
formatter.match({
  "location": "Config_LaunchAppStepDefinition.he_launchs_app()"
});
formatter.result({
  "duration": 5852061756,
  "status": "passed"
});
formatter.match({
  "location": "Config_LaunchAppStepDefinition.he_goes_to_recent_location()"
});
formatter.result({
  "duration": 6150533226,
  "status": "passed"
});
formatter.match({
  "location": "Config_LaunchAppStepDefinition.he_selects_first_report()"
});
formatter.result({
  "duration": 6193159694,
  "status": "passed"
});
formatter.uri("General_Information_Test.feature");
formatter.feature({
  "line": 1,
  "name": "Test General Information screen",
  "description": "",
  "id": "test-general-information-screen",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 3,
  "name": "Validate information of tab Basic info",
  "description": "",
  "id": "test-general-information-screen;validate-information-of-tab-basic-info",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.scenario({
  "line": 5,
  "name": "Fill in fields of tab Factpry info",
  "description": "",
  "id": "test-general-information-screen;fill-in-fields-of-tab-factpry-info",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "the user goes to tab Basic info",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "he fills in Company Name text field",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "he fills in Year Foundation text field",
  "keyword": "And "
});
formatter.step({
  "line": 9,
  "name": "he fills in Location text field",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "he fills in Workers Number text field",
  "keyword": "And "
});
formatter.step({
  "line": 11,
  "name": "he fills in Main Product text field",
  "keyword": "And "
});
formatter.step({
  "line": 12,
  "name": "he selects Done button",
  "keyword": "And "
});
formatter.match({
  "location": "GeneralStepDefinitions.the_user_goes_to_tab_basic_info()"
});
formatter.result({
  "duration": 1463890,
  "error_message": "cucumber.api.PendingException: TODO: implement me\r\n\tat stepDefinition.GeneralStepDefinitions.the_user_goes_to_tab_basic_info(GeneralStepDefinitions.java:22)\r\n\tat ✽.Given the user goes to tab Basic info(General_Information_Test.feature:6)\r\n",
  "status": "pending"
});
formatter.match({
  "location": "GeneralStepDefinitions.he_fills_in_company_name_text_field()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "GeneralStepDefinitions.he_fills_in_year_foundation_text_field()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "GeneralStepDefinitions.he_fills_in_location_text_field()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "GeneralStepDefinitions.he_fills_in_workers_number_text_field()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "GeneralStepDefinitions.he_fills_in_main_product_text_field()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "GeneralStepDefinitions.he_selects_done_button()"
});
formatter.result({
  "status": "skipped"
});
});