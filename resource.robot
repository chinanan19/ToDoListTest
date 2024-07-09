*** Setting ***
Library     Selenium2Library
Library     String
Library     DateTime
Library     BuiltIn

*** Variables ***
# --------------- General ---------------
${server}      https://abhigyank.github.io/To-Do-List/
${browser}     chrome
${delay}       0.5
# --------------- Test Data ---------------
${itemName}    Automated Test 

*** Keywords ***
# --------------- General ---------------
Open Browser url
    Open Browser               ${server}    ${browser}
    Maximize Browser Window
    Set Selenium Speed         ${delay}

Close Browser url
    Close Browser

Delete Task
    Click Button    css = button.delete

# --------------- Tab Add Item ---------------
Add Item
    Click Link    xpath=//a[contains(text(),'Add Item')]
    Input Text    id= new-task                              ${itemName}

Save Item
    Click Button    css= button.mdl-button--colored

# --------------- Tab To Do Tasks ---------------
Select Tab To Do Task
    Click Link    xpath=//a[contains(text(),'To-Do Tasks')]

Check Blank To Do Task
    Element Should Not Be Visible    css= ul#incomplete-tasks li

Check List In To Do Task
    Element Should Be Visible    css= ul#incomplete-tasks li

Make as Completed Task
    Click Element    //*[@id="incomplete-tasks"]/li[1]/label/span[4]
    
# --------------- Tab Completed ---------------
Select Tab Completed 
    Click Link      //a[contains(text(),'Completed')]

