*** Settings ***
Library          Selenium2Library     
Library          String
Library          BuiltIn
Resource         resource.robot
Test Setup       Open Browser url
Test Teardown    Close Browser url

*** Variables ***


*** Keywords ***
Check UI List In Completed
    Element Should Be Visible    css= ul#completed-tasks i
    Element Should Be Visible    css= ul#completed-tasks .mdl-list__item-primary-content
    Element Should Be Visible    css= ul#completed-tasks button

Check Blank In Completed
    Element Should Not Be Visible    css= ul#completed-tasks li

*** Test Cases ***
TC-TDO-01-04-01
    [Documentation]     Check List Completed Task
    [Tags]  Done
    Add Item
    Save Item
    Select Tab To Do Task
    Make as Completed Task
    Select Tab Completed 
    Check UI List In Completed

TC-TDO-01-05-01
    [Documentation]     Test delete task when no data in completed
    [Tags]  Done
    Select Tab Completed 
    Check Blank In Completed

TC-TDO-01-05-02
    [Documentation]     Test delete task when have data in completed
    [Tags]  Done
    Add Item
    Save Item
    Select Tab To Do Task
    Make as Completed Task
    Select Tab Completed 
    Delete Task
