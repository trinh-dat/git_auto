*** Settings ***
Suite Setup       Run Application
Suite Teardown    Close Application
Library           AppiumLibrary
Library           String
Resource          resources.robot
Resource          resource_inspectorio_app.robot

*** Test Cases ***
User can access to Sample Section screen
    App is opened to Packing List

Validate Packing list popup avaiable at the 1st time going to Sample Selection
    ${title}    Get Text    //android.widget.TextView[contains(@resource-id, 'textViewMessage')]
    Should Be Equal    ${title}    Was Packing List provided by Supplier?

Validate Yes function of Packing List popup
    Tap    name=Yes
    ${result}    Element Exist    //android.view.View[contains(@resource-id, 'preview_surface')]
    Should Be True    ${result}

App displays Take More Picture screen
    take_picture_without_overlay
    ${done}    Get Text    //android.widget.LinearLayout[contains(@resource-id, 'defect')]/android.widget.TextView
    ${cameraIcon}    Element Exist    //android.widget.LinearLayout[contains(@resource-id, 'noDefect')]/android.widget.ImageView
    ${name}    Get Text    //android.widget.LinearLayout[contains(@resource-id, 'noDefect')]/android.widget.TextView
    Should Be True    '${done}'=='Done' and ${cameraIcon} and '${name}'=='PACKING LIST'

Select Available Size popup should be displayed after select Done
    Tap    defect
    ${title}    Get Text    //android.widget.TextView[contains(@resource-id, 'txtTitle')]
    Should Be Equal    ${title}    Select Available Size

Having confirm popup right after Select Available Size popup
    Tap    name=OK
    ${text}    Get Text    //android.widget.TextView[contains(@resource-id, 'alertTitle')]
    Should Be Equal    ${text}    Are you sure that you selected available sizes correctly?

Validate first screen of Sample Selection
    Tap    name=Yes
    ${result}    Get Element Attribute    //android.widget.TextView[contains(@resource-id, 'tvTitle') and @text='Packing List']    selected
    Should Be True    '${result}'=='true'
