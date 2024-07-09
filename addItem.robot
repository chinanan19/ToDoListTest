*** Settings ***
Library          Selenium2Library     
Library          String
Library          BuiltIn
Resource         resource.robot
Test Setup       Open Browser url
Test Teardown    Close Browser url

*** Variables ***


*** Keywords ***
Add Blank Item
    Click Link    xpath=//a[contains(text(),'Add Item')]
    Input Text    id= new-task                              ${EMPTY}

*** Test Cases ***
TC-TDO-01-01-01
    [Documentation]     Test system when input null item
    [Tags]  Done
    Add Blank Item
    Save Item
    Select Tab To Do Task
    Check Blank To Do Task

TC-TDO-01-01-02
    [Documentation]     Test system when input value but not save
    [Tags]  Done
    Add Item
    Select Tab To Do Task
    Check Blank To Do Task

TC-TDO-01-01-03
    [Documentation]     Test system when add 1 item
    [Tags]  Done
    Add Item
    Save Item
    Select Tab To Do Task
    Check List In To Do Task

TC-TDO-01-01-04
    [Documentation]     Test system when add more than 1 item
    [Tags]  Done
    FOR    ${i}    IN RANGE    1   2
        Add Item
        Save Item
        Select Tab To Do Task
        Check List In To Do Task
    END
    
    
