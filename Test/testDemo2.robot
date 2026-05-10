*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library        Collections
Test Setup       Open Browser with Mortgage payment url
Test Teardown    Close Browser session
Resource        resource.robot

#Resource
*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_page_load}             css:.nav-link

*** Test Cases ***
#Validate UnSuccessful Login
#
#    Fill the Login Form        ${user_name}        ${invalid_password}
#    wait until Element is located in the page        ${Error_Message_Login}
#    verify error message is correct

Validate Cards display in the shopping Page
    Fill the Login Form        ${user_name}        ${valid_password}
    wait until Element is located in the page        ${Shop_page_load}
    Verify Card title in the Shop page
    Select the Card        Nokia Edge

Select the Form and navigate to Child window
    Fill the Login Details and Login Form


*** Keywords ***

Fill the Login Form
    [Arguments]        ${username}        ${password}
    Input Text        id:username            ${username}
    Input Password    id:password            ${password}
    Click Button      id:signInBtn

wait until Element is located in the page
    [Arguments]        ${element}
    Wait Until Element Is Visible            ${element}

verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}     ##${result} is a variable in which stored text value so we can compare we actual one
    Should Be Equal As Strings    ${result}            Incorrect username/password.
    Element Text Should Be      ${Error_Message_Login}          Incorrect username/password.    ##by using this easy

Verify Card title in the Shop page
    Wait Until Element Is Visible    css:.card-title    10s

    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{elements}=        Get Webelements    css:.card-title

#    Length Should Be    ${elements}    4

    @{actualList}=      Create List
    FOR    ${element}    IN    @{elements}
        Append To List   ${actualList}    ${element.text}
    END

    Lists Should Be Equal    ${expectedList}    ${actualList}

   
Select the Card            ## MOST IMPORTANT PART
    [Arguments]    ${cardName}
    ${elements} =        Get Webelements        css:.card-title
    ${index} =        Set Variable        1
    FOR    ${element}    IN        @{elements}
        Exit For Loop If        '${cardName}' == '${element.text}'
        ${index} =    Evaluate    ${index} + 1
    END
    Click Button        xpath:(//*[@class='card-footer'])[${index}] /button
    
Fill the Login Details and Login Form
        Input Text        id:username            rahulshettyacademy
        Input Password    id:password            Learning@830$3mK2 
        Click Element    css:input[value='user']
        Wait Until Element Is Visible      okayBtn
        Click Button        okayBtn
        Click Button        okayBtn
        Wait Until Element Is Not Visible    okayBtn
        Select From List By Value    css:select.form-control    teach
        Select Checkbox    terms
        Checkbox Should Be Selected    terms