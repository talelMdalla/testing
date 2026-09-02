*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Library             XML
Resource            ../../config/EnvDetails.robot
Resource            ../../config/BrowserDetails.robot
Resource            ../../resources/auth/RegisterKeywords.robot

*** Test Cases ***

Register with valid credentials
    [Tags]    smoke
    Open Browser Page
    Button RegisterForm
    Button AgentForm
    Accept general condition button
    Input FirstName    hamza
    Input LastName    chebbi
    ${email}    Get Random Email
    Input Email    ${email}
    Input Birthday    06    12    1998
    ${phoneNumber}    Get Random Phone Number
    Input Number    ${phoneNumber}
    Input Password    Password123*
    Input ConfirmPassword    Password123*
    Submit Register
    Profile Avatar Should Be Visible