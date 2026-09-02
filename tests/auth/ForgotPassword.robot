*** Settings ***
Documentation       Test cases for forgot password functionality.

Library             SeleniumLibrary
Resource            ../../resources/Common.robot
Resource            ../../resources/auth/ForgotPasswordKeywords.robot

Test Teardown       Close Browser

*** Test Cases ***
Validate reset password with empty email field
    [Tags]    regression
    Open Forgot Password Form
    Submit
    Empty email error

Validate reset password with invalid email
    [Tags]    regression
    Open Forgot Password Form
    Input Email    ${INVALID_EMAIL}
    Submit
    Invalid email error

Validate reset password with email not existing
    [Tags]    regression
    Open Forgot Password Form
    Input Email    ${EmailNotExist}
    Submit
    Email not exist error

Validate reset password with valid email
    [Tags]    smoke
    Open Forgot Password Form
    Input Email    ${VALID_EMAIL}
    Submit
    Success message

*** Keywords ***
Open Forgot Password Form
    Open Browser Page
    # Click the Connexion button (it's on the login page)
    Button LoginForm
    # Click "Mot de passe oublié ?" link
    Forgot password button
    # Wait for the forgot password form to load
    Wait Until Element Is Visible    id:Email    timeout=10s