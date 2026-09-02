*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Library             XML
Resource            ../../config/EnvDetails.robot
Resource            ../../config/BrowserDetails.robot
Resource            ../../resources/auth/RegisterKeywords.robot

Test Teardown       Close Browser

*** Variables ***
${DAY}              06
${MONTH}            12
${YEAR}             1998
${PASSWORD}         Password123*
${FIRST_NAME}       hamza
${LAST_NAME}        chebbi

*** Test Cases ***
Register with empty fields
    [Tags]    regression
    Open Register Agent Form
    Submit Register
    FirstName empty error
    LastName empty error
    Email empty error
    Number empty error
    Birthday empty error
    Password empty error
    ConfirmPassword empty error

Register with email invalid
    [Tags]    regression
    Open Register Agent Form
    Email Number invalid Input    testestest    12345678
    Submit Register
    Invalid email error only

Register with number invalid
    [Tags]    regression
    Open Register Agent Form
    Input FirstName    ${FIRST_NAME}
    Input LastName    ${LAST_NAME}
    Input Birthday    ${DAY}    ${MONTH}    ${YEAR}
    Input Password    ${PASSWORD}
    Input ConfirmPassword    ${PASSWORD}
    Email Number invalid Input    test@test.com    056553
    Submit Register
    # Wait for validation to complete
    Sleep    2s
    Invalid number error only
    
Register with email and number exist
    [Tags]    regression
    Open Register Agent Form
    Input FirstName    ${FIRST_NAME}
    Input LastName    ${LAST_NAME}
    Input Birthday    ${DAY}    ${MONTH}    ${YEAR}
    Input Password    ${PASSWORD}
    Input ConfirmPassword    ${PASSWORD}
    Email Number invalid Input    ghada.sakouhi@esprit.tn    0643274723
    Submit Register
    # Wait for validation to complete
    Sleep    2s
    Email and Number existe error

Register with valid credentials
    [Tags]    smoke
    Open Register Agent Form
    Input FirstName    ${FIRST_NAME}
    Input LastName    ${LAST_NAME}
    ${email}    Get Random Email
    Input Email    ${email}
    Input Birthday    ${DAY}    ${MONTH}    ${YEAR}
    ${phoneNumber}    Get Random Phone Number
    Input Number    ${phoneNumber}
    Input Password    ${PASSWORD}
    Input ConfirmPassword    ${PASSWORD}
    Submit Register
    # Wait for registration to complete
    Wait Until Element Is Visible    xpath://*[@data-test-id="photo_profile"]    timeout=30s
    Profile Avatar Should Be Visible

*** Keywords ***
Open Register Agent Form
    Open Browser Page
    # Click Inscription button
    Button RegisterForm
    # Wait for registration modal to appear
    Wait Until Element Is Visible    xpath://*[@data-test-id="card-individu-modal"]    timeout=10s
    Button AgentForm
    # Wait for registration form to load
    Wait Until Element Is Visible    xpath://*[@id="FirstName"]    timeout=10s
    # Accept general conditions
    Accept general condition button
    Sleep    1s
    # Bypass reCAPTCHA early
    Bypass Recaptcha