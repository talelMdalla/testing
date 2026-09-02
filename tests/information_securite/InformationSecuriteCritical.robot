*** Settings ***
Documentation       Critical smoke coverage for Information de sécurité.
Library             SeleniumLibrary
Resource            ../../resources/information_securite/InformationSecuriteKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
security information is protected behind profile access
    [Documentation]    Critical CI check for Information de sécurité.
    [Tags]    critical    smoke    information_securite
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains    Profil    timeout=30s

profile page is authenticated
    [Documentation]    Critical CI check for Information de sécurité.
    [Tags]    critical    smoke    information_securite
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains Element    xpath=//a[@id='item__header__non_auth' and contains(normalize-space(),'Les Missions')]    timeout=30s
