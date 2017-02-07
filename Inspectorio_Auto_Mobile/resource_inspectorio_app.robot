*** Settings ***
Library           AppiumLibrary
Resource          resources.robot
Library           String

*** Variables ***
${overlay1}       xpath=//android.widget.RelativeLayout[contains(@resource-id,'linRoot')]
${overlay2}       xpath=//android.widget.LinearLayout[contains(@resource-id,'linRoot')]
${client_name}    Grapple
${supplier_name}    N/A
${po_number}      N/A
${model_number}    72400999R92
${order_quantity}    30
${product_description}    Regata Vero Linho
${product_category}    Blous
${inspection_date}    12/30/2016
${inspection_location}    HongKong
${unit_type}      Pieces
${standard}       ISO 2859
${inspection_type}    General
${inspection_level}    Level 1
${estimated_sample_size}    5
&{aql_number}     cr=1.5    ma=2.5    mi=4.0

*** Keywords ***
take_picture_1
    ${status2}    Element Exist    ${overlay1}
    Run keyword if    ${status2}    Tap    linRoot
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

verify starting inspection
    ${status1}    Element Exist    xpath=//android.widget.TextView[@text='Confirm: Starting Inspection']
    Run Keyword If    ${status1}    Tap    name=Yes

take Factory Outside View
    Tap    name=FACTORY BUILDING\nOUTSIDE VIEW
    verify starting inspection
    take_picture_1

take Production Line
    Tap    name=PRODUCTION LINE
    verify starting inspection
    take_picture_1

input factory info
    Tap    txtCompanyName
    Tap    xpath=//android.support.v7.widget.RecyclerView/android.widget.LinearLayout[@index='0']
    Tap    rlButtonNext
    Input Text    txtDateFoundation    2017
    Hide Keyboard
    Tap    rlButtonNext
    Input Text    txtLocation    Viet Nam
    Hide Keyboard
    Tap    rlButtonNext
    Input Text    txtTotalNumWorker    10000
    Hide Keyboard
    Tap    rlButtonNext
    Input Text    txtMainProduct    Jeans
    Hide Keyboard

Select Yes No For Packing List
    [Arguments]    ${choice}
    ${status}    Element Exist    xpath=//android.widget.TextView[@text='Was Packing List provided by Supplier?']
    Run Keyword If    ${status}    Tap    name=${choice}

take Factory Name
    Tap    name=FACTORY NAME
    verify starting inspection
    take_picture_1

take_picture_2
    ${status2}    Element Exist    ${overlay2}
    Run keyword if    ${status2}    Tap    linRoot
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

run_app
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.0.2    deviceName=LRAA99JFSSAYEY79    appPackage=com.asiam.Inspection    appActivity=com.asiam.Inspection.activities.SplashActivity
    ...    noReset=true
    Tap    videoView
    Tap    relRecent
    Sleep    2
    Tap    xpath=//android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle
    Tap    xpath=//android.widget.ImageButton

take_picture_3
    ${status2}    Element Exist    xpath=//android.widget.FrameLayout[contains(@resource-id,'content')]
    Run keyword if    ${status2}    Tap    content
    ${status3}    Element Exist    xpath=//android.widget.LinearLayout[contains(@resource-id, 'overview')]
    Run Keyword If    ${status3}    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

take_Product_picture
    ${status2}    Element Exist    xpath=//android.widget.LinearLayout[contains(@resource-id,'linRoot')]
    Run keyword if    ${status2}    Tap    linRoot
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

Select Yes No for Approved Sample
    [Arguments]    ${choice}
    ${status}    Element Exist    xpath=//android.widget.TextView[@text='Are Approved Samples available for reference?']
    Run Keyword If    ${status}    Tap    name=${choice}

run_Inspection
    ${status}    Element Exist    xpath=//android.widget.Button[contains(@resource-id,'btnStartInspection')]
    Run Keyword If    ${status}    Tap    btnStartInspection
    ...    ELSE    Tap    btnContinueInspection

take_FoldingWay_detailview
    ${status2}    Element Exist    xpath=//android.widget.FrameLayout[contains(@resource-id,'content')]
    Run keyword if    ${status2}    Tap    content
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

take_pictures_for_piece
    Log    Loop to take request pictures of piece ###
    ${matchnotmatch_exist} =    Set Variable    False
    ${backview_exist} =    Set Variable    False
    ${status3}    Element Exist    xpath=//android.widget.ImageView[contains(@resource-id, 'search_view')]
    Run keyword if    ${status3}==False    check_request_take_picture_for_pieces
    Log    Searching defect...
    Sleep    2
    Tap    noDefect
    check_special_attention_area
    Select_Shade_Or_Not    No

Select_Defect_NoDefect
    [Arguments]    ${choice}

Select_Shade_Or_Not
    [Arguments]    ${choice}
    ${status}    Element Exist    xpath=//android.widget.LinearLayout[contains(@resource-id, 'layout_container')]
    Run Keyword If    ${status}    Log    Shade Screen...
    Run Keyword If    ${status}    take_picture_for_ShadeColor    ${choice}

check_request_take_picture_for_pieces
    Log    Have request to take picture for piece ###
    : FOR    ${INDEX}    IN RANGE    1    20
    \    ${imgVisible} =    Element Exist    xpath=//android.widget.ImageView[contains(@resource-id, 'itemImageView')]
    \    ${typeView} =    Get Text    xpath=//android.widget.TextView[contains(@resource-id, 'subTitle')]
    \    ${polyBagOrNot}    Get Text    xpath=//android.widget.TextView[contains(@resource-id, 'mainTitle')]
    \    Log    Check type view to show Match_Not Match or No ###
    \    ${matchnotmatch_exist} =    Set Variable If    ('${typeView}'=='Placement' and ${imgVisible}) or ('${typeView}'=='Overview' and ${imgVisible}) or ('${typeView}'=='Detail View' and ${imgVisible} and '${polyBagOrNot}'!='Poly Bag')    True
    \    ${backview_exist} =    Set Variable If    '${typeView}'== ' Back View'    True
    \    Log    Take picture ${typeView} ###
    \    Tap    overview
    \    Tap    preview_surface
    \    Tap    linTakePicture
    \    Sleep    1
    \    Tap    name=OK
    \    Log    Check availableness of Match_Not Match ###
    \    Run Keyword If    ${matchnotmatch_exist}==True    Tap    tvNotMark
    \    ...    ELSE IF    ${backview_exist}==True    Tap    txtOk
    \    Log    Check display of Magnifying screen ###
    \    ${searchScreen}    Element Exist    xpath=//android.widget.ImageView[contains(@resource-id, 'search_view')]
    \    Exit For Loop If    ${searchScreen}

take_picture_for_ShadeColor
    [Arguments]    ${choice}
    Tap    name=${choice}
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

check_special_attention_area
    ${status}    Element Exist    xpath=//android.widget.TextView[contains(@resource-id, 'tvSpecialAttentionAreaGuide')]
    Run keyword if    ${status}    Log    Special Attentino Area...
    Run Keyword If    ${status}    take_picture_for_specialAttentionArea

take_picture_for_specialAttentionArea
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

check_evidence_picture_or_not
    ${status}    Element Exist    xpath=//android.widget.LinearLayout[contains(@resource-id, 'overview')]
    Run Keyword If    ${status}    take_picture

select_a_size
    [Arguments]    ${size}
    Log    Begin to swipe and select a size ###
    Log    Size = ${size}
    Log    Calculate to get size 0.1, 0.2 , 0.3 ... ###
    Log    Spliting size...
    ${db} =    Convert To Number    ${size}
    Log    Must convert from Float to String for using Split func
    ${dbToString} =    Convert To String    ${db}
    Log    Split sizes to digits and decimal
    ${digits}    ${decimal} =    Split String    ${dbToString}    .
    Log    Get first number of numbers
    ${length} =    Get Length    ${digits}
    ${index} =    Evaluate    ${length} - 1
    ${firstOfDigit} =    Get Substring    ${digits}    ${index}
    ${x} =    set variable if    ${decimal} == 0    321    ${decimal} == 1    441    ${decimal} == 2
    ...    555    ${decimal} == 3    656    ${decimal} == 4    758    ${decimal} == 5
    ...    859    ${decimal} == 6    957    ${decimal} == 7    1060    ${decimal} == 8
    ...    1165    ${decimal} == 9    1266
    ${y} =    set variable if    ${decimal} == 0    881    ${decimal} == 1    681    ${decimal} == 2
    ...    532    ${decimal} == 3    681    ${decimal} == 4    532    ${decimal} == 5
    ...    681    ${decimal} == 6    532    ${decimal} == 7    681    ${decimal} == 8
    ...    532    ${decimal} == 9    681
    ${swipe} =    set variable if    ${firstOfDigit} == 0    0    ${firstOfDigit} == 1    1    ${firstOfDigit} == 2
    ...    2    ${firstOfDigit} == 3    3    ${firstOfDigit} == 4    4    ${firstOfDigit} == 5
    ...    5    ${firstOfDigit} == 6    6    ${firstOfDigit} == 7    7    ${firstOfDigit} == 8
    ...    8    ${firstOfDigit} == 9    9
    Log    Finish to set offset_x, offset_y, swipe time ###
    Log    Offset X = ${x}
    Log    Offset Y = ${y}
    Log    SwipeTime = ${swipe}
    : FOR    ${INDEX}    IN RANGE    0    ${swipe}
    \    Swipe    1369    676    366    676    2800
    \    Sleep    2
    Click A Point    ${x}    ${y}
    check_evidence_picture_or_not

take_picture
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

take_seal_measurement
    Log    Sealed Sample && Seal Number ###
    ${description}    Get Text    xpath=//android.widget.TextView[contains(@resource-id, 'title')]
    Should Be Equal    ${description}    Sealed Sample    # Verify Sealed Sample
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK
    ${description}    Get Text    xpath=//android.widget.TextView[contains(@resource-id, 'title')]
    Should Be Equal    ${description}    Seal Number    # Verify Sealed Number
    Tap    overview
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

check_out_of_tolerance
    [Arguments]    ${value}    ${spec}    ${tolerance}
    ${result}    Evaluate    ${value} > ${spec} + 2 * ${tolerance}

App is opened to Basic Info screen
    Tap    relRecent
    Sleep    2
    Tap    xpath=//android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle

Run Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.0.2    deviceName=LRAA99JFSSAYEY79    appPackage=com.asiam.Inspection    appActivity=com.asiam.Inspection.activities.SplashActivity
    ...    noReset=true
    Tap    videoView

Validate Basic Information
    Log    Verify slide section 1 ###
    ${var1}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtClientName')]
    Should Be Equal    ${var1}    ${client_name}
    ${var2}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtSupplierName')]
    Should Be Equal    ${var2}    ${supplier_name}
    ${var3}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtSupplierNamePO')]
    Should Be Equal    ${var3}    ${po_number}
    ${var4}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtItemNo')]
    Should Be Equal    ${var4}    ${model_number}
    ${var5}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtOrderQuantity')]
    Should Be Equal    ${var5}    ${order_quantity}
    Log    Verify slide section 2 ###
    Tap    ivNext
    Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id, 'txtProductDescription')]    5
    ${var6}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtProductDescription')]
    Should Be Equal    ${var6}    ${product_description}
    ${var7}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtProductCategory')]
    Should Be Equal    ${var7}    ${product_category}
    ${var8}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtInspectionDate')]
    Should Be Equal    ${var8}    ${inspection_date}
    ${var9}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtInspectionLocation')]
    Should Be Equal    ${var9}    ${inspection_location}
    ${var10}    Get Text    //android.widget.EditText[contains(@resource-id, 'etUnitType')]
    Should Be Equal    ${var10}    ${unit_type}
    Log    Verify slide section 3 ###
    Tap    ivNext
    Wait Until Element Is Visible    //android.widget.EditText[contains(@resource-id, 'textStandard')]    5
    ${var11}    Get Text    //android.widget.EditText[contains(@resource-id, 'textStandard')]
    Should Be Equal    ${var11}    ${standard}
    ${var12}    Get Text    //android.widget.TextView[contains(@resource-id, 'textCrAqlNumber')]
    Should Be Equal    ${var12}    ${aql_number.cr}
    ${var13}    Get Text    //android.widget.TextView[contains(@resource-id, 'textMaAqlNumber')]
    Should Be Equal    ${var13}    ${aql_number.ma}
    ${var14}    Get Text    //android.widget.TextView[contains(@resource-id, 'textMiAqlNumber')]
    Should Be Equal    ${var14}    ${aql_number.mi}
    ${var15}    Get Text    //android.widget.EditText[contains(@resource-id, 'textInspectionType')]
    Should Be Equal    ${var15}    ${inspection_type}
    ${var16}    Get Text    //android.widget.EditText[contains(@resource-id, 'textLevel')]
    Should Be Equal    ${var16}    ${inspection_level}
    ${var17}    Get Text    //android.widget.EditText[contains(@resource-id, 'txtinspectionSample')]
    Should Be Equal    ${var17}    ${estimated_sample_size}

App is opened to Factory Info
    Tap    relRecent
    Sleep    2
    Tap    xpath=//android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle
    Tap    name=Factory Info

App is opened to Reference Photos
    Tap    relRecent
    Sleep    2
    Tap    xpath=//android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle
    Tap    name=Reference Photos

App is opened to Packing List
    Tap    relRecent
    Sleep    2
    Tap    //android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle
    Tap    //android.view.View[contains(@resource-id, 'toolbar')]/android.widget.ImageButton
    Tap    name=Sample Selection
    Tap    tvTitle

take_picture_without_overlay
    Tap    preview_surface
    Tap    linTakePicture
    Sleep    1
    Tap    name=OK

App is opened to Checklist Tests
    Tap    relRecent
    Sleep    2
    Tap    //android.widget.ListView/android.widget.LinearLayout[@index='0']
    Tap    name=Open Report
    Tap    tvTitle
    Tap    //android.view.View[contains(@resource-id, 'toolbar')]/android.widget.ImageButton
    Tap    name=First Section
    Tap    name=Second Section
    Tap    name=Attachment Photo
    Tap    tvTitle

Create new report
    Tap    ivMenu
    Tap    name=New Report
    Tap    name=Browse File
    Scroll Bottom    //android.support.v7.widget.RecyclerView/android.widget.LinearLayout[@index='3']    //android.support.v7.widget.RecyclerView/android.widget.LinearLayout[@index='0']
    Tap    name=quick full run_1611.zip
    Wait Until Element Is Visible    //android.widget.TextView[contains(@resource-id, 'txtOk')]
    Tap    name=OK
