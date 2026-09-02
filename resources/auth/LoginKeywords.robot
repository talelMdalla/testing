*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${requiredTextError}        Ce champ est obligatoire
${emailOrPasswordError}     Email ou mot de passe invalide
${InvalidEmailError}        S'il vous plaît entrez un email valide


*** Keywords ***
Button LoginForm
    # FIXED: Using the correct locator
    Common.Click Element    xpath://*[@data-test-id='button-login-loginModal']  ${SMALL_RETRY_COUNT}
    
Input Email
    [Arguments]    ${email}
    Common.Set Text    id:email    ${email}  ${SMALL_RETRY_COUNT}

Input Password
    [Arguments]    ${password}
    Common.Set Text    xpath://input[@type='password']    ${password}  

Submit Login
    Common.Click Element    xpath://*[@data-test-id='button-login-loginModal']   ${SMALL_RETRY_COUNT}

Empty email error
    Element Text Should Contain    xpath://*[@data-test-id="email-error"]    ${requiredTextError}  ${SMALL_RETRY_COUNT}

Empty password error
    Element Text Should Contain    xpath://*[@data-test-id="password-error"]    ${requiredTextError}  ${SMALL_RETRY_COUNT}

Invalid email or password error
    Wait Until Element Is Visible    xpath://*[@data-test-id="login_field_error"]    10s
    Element Text Should Contain    xpath://*[@data-test-id="login_field_error"]    ${emailOrPasswordError}  ${SMALL_RETRY_COUNT}

Invalid email error
    Element Text Should Contain    xpath://*[@data-test-id="email-error"]    ${InvalidEmailError}  ${SMALL_RETRY_COUNT}