*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Common.robot

*** Variables ***
${expectedPageUrl}          https://dev.daxme.fr/verif-code
${requiredTextError}        Ce champ est obligatoire
${InvalideNumberError}      Veuillez saisir un numéro valide
${InvalideEmailError}       S'il vous plaît entrez un email valide
${EmailExistError}          Adresse mail déja utilisée
${NumberExistError}         Numéro de téléphone déja utilisé

*** Keywords ***
Button RegisterForm
    # Click Inscription button on login page
    Common.Click Element    xpath://button[contains(text(), "Inscription")]    ${SMALL_RETRY_COUNT}
    
Button AgentForm
    Common.Click Element    xpath://*[@data-test-id="card-individu-modal"]    ${SMALL_RETRY_COUNT}

Input FirstName
    [Arguments]    ${FirstName}
    Common.Set Text    xpath://*[@id="FirstName"]    ${FirstName}    ${SMALL_RETRY_COUNT}

Input LastName
    [Arguments]    ${LastName}
    Common.Set Text    xpath://*[@id="lastName"]    ${LastName}    ${SMALL_RETRY_COUNT}

Input Email
    [Arguments]    ${Email}
    Common.Set Text    xpath://*[@id="mail"]    ${Email}    ${SMALL_RETRY_COUNT}

Input Birthday
    [Arguments]    ${day}    ${month}    ${year}
    # Click on the date picker inputs directly
    Click Element    xpath=//span[@aria-label="Day"]
    Press Keys    xpath=//span[@aria-label="Day"]    ${day}
    Sleep    0.5s
    Click Element    xpath=//span[@aria-label="Month"]
    Press Keys    xpath=//span[@aria-label="Month"]    ${month}
    Sleep    0.5s
    Click Element    xpath=//span[@aria-label="Year"]
    Press Keys    xpath=//span[@aria-label="Year"]    ${year}
    Sleep    0.5s

Input Number
    [Arguments]    ${Number}
    Common.Set Text    xpath://input[@type="tel"]    ${Number}    ${SMALL_RETRY_COUNT}
    Press Keys    xpath://input[@type="tel"]    TAB

Input Password
    [Arguments]    ${Password}
    # Try different possible password field locators
    ${status}=    Run Keyword And Return Status    Common.Set Text    xpath://*[@name="password1"]    ${Password}    ${SMALL_RETRY_COUNT}
    Run Keyword If    not ${status}    Common.Set Text    xpath://*[@name="password"]    ${Password}    ${SMALL_RETRY_COUNT}
    Run Keyword If    not ${status}    Common.Set Text    xpath://input[@type='password']    ${Password}    ${SMALL_RETRY_COUNT}

Input ConfirmPassword
    [Arguments]    ${ConfirmPassword}
    # Try different possible confirm password field locators
    ${status}=    Run Keyword And Return Status    Common.Set Text    xpath://*[@name="password2"]    ${ConfirmPassword}    ${SMALL_RETRY_COUNT}
    Run Keyword If    not ${status}    Common.Set Text    xpath://*[@name="confirmPassword"]    ${ConfirmPassword}    ${SMALL_RETRY_COUNT}
    Run Keyword If    not ${status}    Common.Set Text    xpath:(//input[@type='password'])[2]    ${ConfirmPassword}    ${SMALL_RETRY_COUNT}

Submit Register
    # FIXED: Bypass reCAPTCHA before submitting
    Bypass Recaptcha
    Common.Click Element    xpath://*[@data-test-id="button-singupAgent-modal"]    ${SMALL_RETRY_COUNT}

Accept general condition button
    Common.Click Element    xpath=//input[@type="checkbox"]/..    ${SMALL_RETRY_COUNT}

Bypass Recaptcha
    [Documentation]    Bypass reCAPTCHA using localStorage
    # Set localStorage flag to disable reCAPTCHA
    Execute JavaScript    window.localStorage.setItem('disable-recaptcha-daxme-test', 'true');
    Sleep    1s
    Log    reCAPTCHA bypassed using localStorage

Email Number invalid Input
    [Arguments]    ${Email}    ${Number}
    Common.Set Text    xpath://*[@id="mail"]    ${Email}    ${SMALL_RETRY_COUNT}
    Common.Set Text    xpath://input[@type="tel"]    ${Number}    ${SMALL_RETRY_COUNT}
    
FirstName empty error
    Element Text Should Contain  xpath://*[@data-test-id="error_first_name"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

LastName empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_last_name"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Email empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_email"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Birthday empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_date_of_birth"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Number empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_phone_number"]   ${requiredTextError}  ${SMALL_RETRY_COUNT}

Password empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_password_1"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

ConfirmPassword empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_password2"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Invalid number and email error
    Element Text Should Contain   xpath://*[@data-test-id="errorphone"]  ${InvalideNumberError}  ${SMALL_RETRY_COUNT}
    Element Text Should Contain   xpath://*[@data-test-id="error_email"]  ${InvalideEmailError}  ${SMALL_RETRY_COUNT}

Email and Number existe error
    Element Text Should Contain   xpath://*[@data-test-id="erroremail"]  ${EmailExistError}  ${SMALL_RETRY_COUNT}
    Element Text Should Contain   xpath://*[@data-test-id="errorphone"]  ${NumberExistError}  ${SMALL_RETRY_COUNT}

Invalid email error only
    Element Text Should Contain   xpath://*[@data-test-id="error_email"]  ${InvalideEmailError}  ${SMALL_RETRY_COUNT}

Invalid number error only
    Element Text Should Contain   xpath://*[@data-test-id="errorphone"]  ${InvalideNumberError}  ${SMALL_RETRY_COUNT}