*** Settings ***
Documentation       Critical smoke coverage for SOS.
Library             SeleniumLibrary
Resource            ../../resources/sos/SosKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
SOS page is available
    [Documentation]    Critical CI check for SOS.
    [Tags]    critical    smoke    sos
    Open Domain Route    /app/emergency-call
    Sleep    4s
    Wait Until Page Contains    Appel sos    timeout=30s

SOS page exposes safe navigation controls
    [Documentation]    Critical CI check for SOS.
    [Tags]    critical    smoke    sos
    Open Domain Route    /app/emergency-call
    Sleep    4s
    Wait Until Page Contains    Liste de contacts    timeout=30s
    Wait Until Page Contains    Historique des alerts    timeout=30s
    Wait Until Page Contains Element    xpath=//button[normalize-space()='Envoyer alerte']    timeout=30s
