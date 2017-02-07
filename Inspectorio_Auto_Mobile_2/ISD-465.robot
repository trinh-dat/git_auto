*** Settings ***
Suite Setup       Run Application
Suite Teardown    Close Application
Library           AppiumLibrary
Library           String
Resource          resources.robot
Resource          resource_inspectorio_app.robot

*** Test Cases ***
Create data to test
    App is opened to Checklist Tests
    Log    Let system auto take picture ###
    Tap    //android.widget.ListView[contains(@resource-id, 'listAttachments')]/android.widget.LinearLayout[@index='1']/android.widget.GridView/android.widget.LinearLayout[@index='0']
    Tap    overview
    Sleep    11
    Tap    content
    Sleep    11
    Input Text    attachmentDialogDescription    Can not scan barcode
    Hide Keyboard
    Tap    name=OK
    Tap    defect
    Log    Manually take picture in 10s ###
    Tap    overview
    Sleep    11
    Tap    content
    Tap    btnTakePicture
    Input Text    attachmentDialogDescription    Can not scan barcode 2
    Hide Keyboard
    Tap    name=OK
    Tap    defect
    Log    Dismiss overlay and camera screen
    Tap    overview
    Wait Until Element Is Visible    //android.view.View[contains(@resource-id, 'preview_surface')]
    Press Keycode    4

Validate available remark when manually take picture
    Tap    //android.support.v7.widget.LinearLayoutCompat/android.widget.ImageView
    Tap    name=SPECIAL POINT
    Wait Until Element Is Visible    //android.widget.ExpandableListView[contains(@resource-id, 'listViewSpecialPoint')]/android.widget.LinearLayout[@index='1']
    Scroll    name=List special points of REMARK    name=Special Point
    ${remark}    Get Text    //android.widget.ExpandableListView/android.widget.LinearLayout[@index='1']/android.widget.LinearLayout/android.widget.LinearLayout[@index='0']/android.widget.TextView
    Should Contain    ${remark}    Barcode is not readable by Inspectorio application

Validate remark when system can not scan barcode
    ${remark}    Get Text    //android.widget.ExpandableListView/android.widget.LinearLayout[@index='2']/android.widget.LinearLayout/android.widget.LinearLayout[@index='0']/android.widget.TextView
    Should Contain    ${remark}    Barcode is not readable by Inspectorio application
