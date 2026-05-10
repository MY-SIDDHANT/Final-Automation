*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
#Resource
*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Test Cases ***
Validate UnSuccessful Login
    Open Browser with Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct


*** Keywords ***
Open Browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username                rahulshettyacademy
    Input Password    id:password                12345678
    Click Button      id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible        ${Error_Message_Login}

verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}     ##${result} is a variable in which stored text value so we can compare we actual one
    Should Be Equal As Strings    ${result}            Incorrect username/password.
    Element Text Should Be      ${Error_Message_Login}          Incorrect username/password.