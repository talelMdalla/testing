*** Settings ***
Documentation       Critical smoke coverage for Autres modules.
Library             SeleniumLibrary
Resource            ../../resources/autres_modules/AutresModulesKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
messaging workspace is available
    [Documentation]    Critical CI check for Autres modules.
    [Tags]    critical    smoke    autres_modules
    Open Domain Route    /app/messages
    Sleep    4s
    Wait Until Page Contains    Messagerie    timeout=30s

contracts and messaging routes remain authenticated
    [Documentation]    Critical CI check for Autres modules.
    [Tags]    critical    smoke    autres_modules
    Open Domain Route    /app/messages
    Sleep    4s
    Open Domain Route    /app/contracts
    Sleep    4s
    Wait Until Page Contains    Contrats en cours    timeout=30s
    Wait Until Page Contains    Contrats en cours    timeout=30s
