*** Settings ***
Documentation       Test cases for the 'Report Bugs' functionality.

Library             SeleniumLibrary
Resource            ../../config/CredentialsDetails.robot

Suite Setup         Open Browser    ${URL}    chrome
Suite Teardown      Close Browser


*** Variables ***
${URL}          https://dev.daxme.fr/app/login
${EMAIL}        test_agent@yopmail.com
${PASSWORD}     Daxme2021&


*** Test Cases ***
Report Bug Form - Display and Validation
    [Documentation]    Vérifie l'accès au formulaire de signalement de bugs et la présence des champs obligatoires.
    Set Window Size    width=1920    height=1080
    ${cookie_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=rcc-confirm-button    timeout=5s
    Run Keyword If    ${cookie_visible}    Click Button    id=rcc-confirm-button
    Input Text    id=email    ${EMAIL}
    Input Password    xpath=//input[@type='password']    ${PASSWORD}
    Wait Until Element Is Visible    xpath=//button[@data-test-id='button-login-loginModal' or contains(.,'Connexion') or contains(.,'Login')]    timeout=60s
    Wait Until Element Is Enabled    xpath=//button[@data-test-id='button-login-loginModal' or contains(.,'Connexion') or contains(.,'Login')]    timeout=60s
    Click Button    xpath=//button[@data-test-id='button-login-loginModal' or contains(.,'Connexion') or contains(.,'Login')]
    Wait Until Page Contains Element    xpath=//*[@data-test-id='photo_profile' or @data-test-id='profile']    timeout=60s
    Click Element    xpath=//*[@data-test-id='profile' or @data-test-id='photo_profile']
    Wait Until Page Contains Element    xpath=//*[@data-test-id='report-bugs']    timeout=30s
    Click Element    xpath=//*[@data-test-id='report-bugs']
    Wait Until Page Contains Element    xpath=//form
    Page Should Contain Element    xpath=//*[@id='address__form__input']
    Page Should Contain Element    xpath=//*[@id='exp__form__input']
    Page Should Contain Element    xpath=//input[@type='file' and @name='myfile']
    # Vérifier qu'on peut uploader jusqu'à 4 fichiers (si possible)
    # Page Should Contain Element    xpath=(//input[@type='file'])[4]
    [Teardown]    Close Browser
