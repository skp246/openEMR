*** Settings ***
Documentation    This file will test all the valid credential in 
...    open emr site

Resource    ../Resource/Base/common_functionality.resource 

Test Setup    Launch_Browser
Test Teardown    End_Browser 

*** Test Cases ***
TC01_InValid_credential

    Input Text    xpath=//input[@id='authUser']    admin312   
    Input Password    id=clearPass    pass   
    Select From List By Label    name=languageChoice    English (Indian)   
    Click Element    xpath=//button[@type='submit'] 
    Element Should Contain    //div[@class='alert alert-danger login-failure m-1']    Invalid username or password
    Capture Page Screenshot    Failed Login
