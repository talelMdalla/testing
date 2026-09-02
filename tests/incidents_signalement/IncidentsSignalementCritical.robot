*** Settings ***
Documentation       Critical smoke coverage for Incidents et signalement de bugs.
Library             SeleniumLibrary
Resource            ../../resources/incidents_signalement/IncidentsSignalementKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
incident history is available
    [Documentation]    Critical CI check for Incidents et signalement de bugs.
    [Tags]    critical    smoke    incidents_signalement
    Open Domain Route    /app/incidents
    Sleep    4s
    Wait Until Page Contains    Liste des incidents    timeout=30s

incident history exposes search
    [Documentation]    Critical CI check for Incidents et signalement de bugs.
    [Tags]    critical    smoke    incidents_signalement
    Open Domain Route    /app/incidents
    Sleep    4s
    Wait Until Page Contains Element    xpath=//input[@placeholder='Rechercher']    timeout=30s
