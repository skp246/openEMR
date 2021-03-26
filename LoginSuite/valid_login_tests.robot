*** Settings ***
Documentation    This file will test all the valid credential in 
...    open emr site
 
Resource    ../Resource/Base/common_functionality.resource   

Test Setup    Launch_Browser
Test Teardown    End_Browser

*** Test Cases ***
TC01_Valid_credential

    Input Text    xpath=//input[@id='authUser1']    admin   
    Input Password    id=clearPass    pass   
    Select From List By Label    name=languageChoice    English (Indian)   
    Click Element    xpath=//button[@type='submit']  
    Wait Until Page Contains Element    xpath=//span[@data-bind='text:fname']    timeout=30s
    Page Should Contain    Flow Board
    Mouse Over    //span[@data-bind='text:fname']
    Click Element    xpath=//li[text()='Logout']
    Wait Until Page Contains Element    xpath=//input[@id='authUser']        timeout=30s
    Title Should Be    OpenEMR Login
