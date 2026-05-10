*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library        Collections
Library        String
Test Setup       Open Browser with Mortgage payment url
Test Teardown    Close Browser session
Resource        resource.robot

#Resource
*** Variables ***
${Error_Message_Login}        css:.alert-danger


*** Test Cases ***
Validate Child window Functionality       ##TESTCASE
    Select the link of Child window            ## TEST STEPS
    Verify the user is Switched to Child window
    Grab the Email id in the Child window
    Switch to Parent widow and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep            5

Verify the user is Switched to Child window
    Switch Window    NEW
    Element Text Should Be    css:div[class='inner-box'] h1        DOCUMENTS REQUEST
    
Grab the Email id in the Child window
    ${text}=        get text             css:.red
    @{words}=        Split String          ${text}        at
    ##0 -> Please email u
    ##1 ->  mentor@rahulshettyacademy.com with below template to receive response
    ${test_split}=        Get From List    ${words}    1
    log           ${test_split}
    @{words_2}=        Split String        ${test_split}
    ##0 ->mentor@rahulshettyacademy.com
    ${email}=        Get From List    ${words_2}      0
    Set Global Variable        ${email}

Switch to Parent widow and enter the Email
    Switch Window          MAIN
    Title Should Be        LoginPage Practise | Rahul Shetty Academy
    Input Text             id:username        ${email}
    Sleep            5





    


    