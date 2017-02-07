*** Settings ***
Library           AppiumLibrary

*** Keywords ***
Element Exist
    [Arguments]    ${xpath}
    [Documentation]    Determines if the desired element exists
    ${elementCount} =    Get Matching Xpath Count    ${xpath}
    ${elementExists} =    Evaluate    ${elementCount} > 0
    [Return]    ${elementExists}

Scroll Bottom
    [Arguments]    ${last_item_locator_in_recycleView}    ${first_item_locator_in_recycleView}
    Scroll    ${last_item_locator_in_recycleView}    ${first_item_locator_in_recycleView}
