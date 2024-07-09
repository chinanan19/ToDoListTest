*** Settings ***
Library          Selenium2Library     
Library          String
Library          BuiltIn
Resource         resource.robot
Test Setup       Open Browser url
Test Teardown    Close Browser url

*** Variables ***


*** Keywords ***
Check List In Completed
    Element Should Be Visible    css= ul#completed-tasks li

Check unavailable Delete
    Element Should Not Be Visible    css= .mdl-button.delete

*** Test Cases ***
TC-TDO-01-02-01
    [Documentation]     Test change status task when no data in to do task 
    [Tags]  Done
    Select Tab To Do Task
    Check Blank To Do Task

TC-TDO-01-02-02
    [Documentation]     Test change status task when have data in to do task 
    [Tags]  Done
    Add Item
    Save Item
    Select Tab To Do Task
    Make as Completed Task
    Select Tab Completed 
    Check List In Completed

TC-TDO-01-03-01
    [Documentation]     Test delete task when no data in to do task 
    [Tags]  Done
    Select Tab To Do Task
    Check unavailable Delete

TC-TDO-01-03-02
    [Documentation]     Test delete task when have data in to do task 
    [Tags]  Done
    Add Item
    Save Item
    Select Tab To Do Task
    Delete Task