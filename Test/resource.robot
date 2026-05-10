*** Settings ***
Documentation            A resource file with resusable keywords and variables.
...                     The system specific keywords created here form our own
...                     domain specific language. They utilize keywords provided
...                     by the imported SeleniumLibrary
Library                SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}        1234567
${valid_password}            Learning@830$3mK2
${url}                    https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***

Open Browser with Mortgage payment url
    Create Webdriver    Chrome
    Go To        ${url}

Close Browser session
     Close Browser

