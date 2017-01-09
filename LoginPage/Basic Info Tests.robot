*** Settings ***
Suite Setup       Run Application
Suite Teardown    Close Application
Library           AppiumLibrary
Library           String
Resource          resources.robot
Resource          resource_inspectorio_app.robot

*** Variables ***

*** Test Cases ***
Validate Basic Info
    Given App is opened to Basic info screen
    Then Validate Basic Information
