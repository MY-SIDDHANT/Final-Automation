*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${Error_msg_Login}        css:.alert-danger


*** Test Cases ***
Validate Unsuccessful login
        open browser with mortgage payment url
        fill login form
        wait untill checks error msg
        verify error msg is correct

*** Keywords ***
open browser with mortgage payment url
        Create Webdriver    Chrome
        Go To        https://rahulshettyacademy.com/loginpagePractise/
        
fill login form
        Input Text            id=username        siddhantlogin
        Input Password        id=password        123456
        Click Button            id=signInBtn
        
wait untill checks error msg
    Wait Until Element Is Visible            ${Error_msg_Login}

verify error msg is correct
    Element Text Should Be         ${Error_msg_Login}        Incorrect username/password.
    
    
        