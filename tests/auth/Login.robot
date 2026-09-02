*** Settings ***
Documentation       Test cases for login functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Resource            ../../resources/auth/LoginKeywords.robot
Resource            ../../config/CredentialsDetails.robot

Test Teardown       Close Browser

*** Variables ***
${VALID_EMAIL}          ${TEST_EMAIL_AUTH}
${VALID_PASSWORD}       ${TEST_PASS_AUTH}
${INVALID_EMAIL}        testing1.daxme@gmail.com
${INVALID_PASSWORD}     Hamza123*
${EMAIL_INVALID}        hamza.com

*** Test Cases ***
Login with valid credentials
    [Tags]    smoke
    Open Login Form
    Input Email    ${VALID_EMAIL}
    Input Password    ${VALID_PASSWORD}
    Submit Login
    Profile Avatar Should Be Visible

Login with empty fields
    [Tags]    regression
    Open Login Form
    Submit Login
    Empty email error
    Empty password error

Login with email or password invalid
    [Tags]    regression
    Open Login Form
    Input Email    ${INVALID_EMAIL}
    Input Password    ${INVALID_PASSWORD}
    Submit Login
    Invalid email or password error

Login with email invalid
    [Tags]    regression
    Open Login Form
    Input Email    ${EMAIL_INVALID}
    Input Password    ${INVALID_PASSWORD}
    Invalid email error

*** Keywords ***
Open Login Form
    Open Browser Page
    Button LoginForm