*** Settings ***
Library           AppiumLibrary
Resource          resources.robot
Resource          resource_inspectorio_app.robot
Library           Collections
Library           String

*** Variables ***
${SAMPLE_SIZE}    3
${is_SEAL}        True
@{1stSize_SampleA}    50.1    44.2    43.5
@{1stSize_SampleB}    50.2    44.1    43.3
@{1stSize_SampleC}    50.3    44.3    43.2
@{1stSize}        @{1stSize_SampleA}    @{1stSize_SampleB}    @{1stSize_SampleC}

*** Test Cases ***
go through GeneralInformation
    Comment    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=4.4.2    deviceName=0fc991fe    appPackage=com.asiam.Inspection
    ...    appActivity=com.asiam.Inspection.activities.SplashActivity    noReset=true
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.0.2    deviceName=LRAA99JFSSAYEY79    appPackage=com.asiam.Inspection    appActivity=com.asiam.Inspection.activities.SplashActivity
    ...    noReset=true
    Skip video screen
    Open Recent section
    Sleep    2
    Tap    xpath=//android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle
    Tap    name=Factory Info
    ${status}    Element Exist    xpath=//android.widget.Button[contains(@resource-id, 'btnGetData')]
    Run Keyword If    ${status} == True    Tap    btnGetData
    ...    ELSE    input factory info
    Tap    name=Reference Photos
    ${status}    Element Exist    xpath=//android.widget.TextView[@text='FACTORY BUILDING\nOUTSIDE VIEW']
    Run Keyword If    ${status} == True    take Factory Outside View
    ${status}    Element Exist    xpath=//android.widget.TextView[@text='FACTORY NAME']
    Run Keyword If    ${status} == True    take Factory Name
    ${status}    Element Exist    xpath=//android.widget.TextView[@text='PRODUCTION LINE']
    Run Keyword If    ${status} == True    take Production Line
    Tap    name=OK
    Log    Scroll down to see random picture
    Scroll    name=Factory Info    name=General Information
    Tap    xpath=//android.widget.GridView[contains(@resource-id,'gvImageRandom')]/android.widget.FrameLayout[@index='1']
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK
    Tap    xpath=//android.widget.GridView[contains(@resource-id,'gvImageRandom')]/android.widget.FrameLayout[@index='2']
    Sleep    1
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK
    Tap    xpath=//android.widget.GridView[contains(@resource-id,'gvImageRandom')]/android.widget.FrameLayout[@index='3']
    Sleep    1
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK
    Tap    name=Go to Sample Selection

go through SampleSelection
    run_app
    Tap    name=Sample Selection
    Sleep    1
    Tap    tvTitle
    Select Yes No For Packing List    No
    Comment    take_picture_1
    Comment    Tap    txtOk
    Comment    Tap    button1
    Tap    name=Carton Stack
    Sleep    2
    take_picture_1
    Tap    txtOk
    take_picture_1
    Tap    txtOk
    take_picture_2
    take_picture_2
    Tap    name=CARTON SELECTION
    Scroll    name=Sample    name=Carton Stack
    Tap    btnGetMadatoryCarton
    Input Text    editNumberCarton    1
    Tap    txtOk
    Tap    button2
    Tap    name=Go to Workmanship

go through Workmanshipp
    run_app
    Scroll    name=First Section    name=Main Menu
    Tap    name=Workmanship
    Tap    tvTitle
    Select Yes No for Approved Sample    No
    Tap    name=Inspection
    run_Inspection
    Log    Export carton with good inside ###
    take_picture_3
    Log    Unit inside packng method ###
    take_picture_3
    Log    Folding Way ###
    Log    Overview FoldingWay ###
    take_picture_3
    Log    Detail View FoldingWay ###
    take_FoldingWay_detailview
    Log    Product Picture ###
    : FOR    ${INDEX}    IN RANGE    1    2
    \    Log    ${INDEX}nd color
    \    Tap    content
    \    take_Product_picture
    \    take_Product_picture
    \    take_Product_picture
    \    take_Product_picture
    Log    Pieces ###
    : FOR    ${INDEX}    IN RANGE    1    80
    \    Log    Dismiss Piece Preview ###
    \    Tap    content
    \    take_pictures_for_piece
    \    Log    Finish a piece ###
    Log    Finish Inspection ###

run only Measurement
    [Template]    a, b, c
    run_app
    Tap    name=First Section
    Tap    name=Second Section
    Tap    name=Measurements
    Tap    tvTitle
    Tap    title
    Log    1ST SAMPLE ###
    @{LIST} =    Create List    5-
    : FOR    ${ITEM}    IN    1    3
    \    select_a_size    ${ITEM}
    \    Log    Finish size ${ITEM} ###
    \    Sleep    2
    Comment    :FOR    ${INDEX}    IN RANGE    1    10
    Comment    \    Swipe    1369    676    366    676
    ...    2800
    Comment    \    Sleep    2
    Close Application

run Measurement only
    run_app
    Tap    name=First Section
    Tap    name=Second Section
    Tap    name=Measurements
    Tap    tvTitle
    Tap    title
    Log    Set list of available sizes ###
    @{1stSize_SampleA} =    Create List    50.1    44.2    43.3
    @{1stSize_SampleB} =    Create List    50.2    44.1    43.3
    @{1stSize_SampleC} =    Create List    50.3    44.3    43.2
    Log    1ST SIZE ###
    : FOR    ${ITEM}    IN    @{list_first_sizes}
    \    Log    ${ITEM}
    \    select_a_size    ${ITEM}
    \    Sleep    2
    Run Keyword If    ${is_SEAL}    take_seal_measurement
    Log    Weight Verification ###
    ${description} =    Get Text    xpath=//android.widget.TextView[contains(@resource-id, 'subTitle')]
    Should Be Equal    ${description}    Weight Verification    # Passed if have Weight Verification
    Log    Take Weight Verification ###
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK
    Log    2ND SIZE ###
    Close Application

testttttt
    Log List    @{1stSize}

*** Keywords ***
take picture then sleep
    Sleep    1
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK
    Sleep    3
