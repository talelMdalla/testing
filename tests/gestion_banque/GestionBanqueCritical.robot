*** Settings ***
Documentation       Critical smoke coverage for Gestion de banque.
Library             SeleniumLibrary
Resource            ../../resources/gestion_banque/GestionBanqueKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
bank information is protected behind authenticated profile
    [Documentation]    Critical CI check for Gestion de banque.
    [Tags]    critical    smoke    gestion_banque
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains    Profil    timeout=30s

banking area does not open anonymously
    [Documentation]    Critical CI check for Gestion de banque.
    [Tags]    critical    smoke    gestion_banque
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains Element    xpath=//a[@id='item__header__non_auth' and contains(normalize-space(),'Les Missions')]    timeout=30s
