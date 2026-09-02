*** Settings ***
Documentation       Critical smoke coverage for Gestion de mission.
Library             SeleniumLibrary
Resource            ../../resources/gestion_mission/GestionMissionKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
mission landing page is available
    [Documentation]    Critical CI check for Gestion de mission.
    [Tags]    critical    smoke    gestion_mission
    Open Domain Route    /app/landingpage
    Sleep    4s
    Wait Until Page Contains    Les Missions    timeout=30s

mission workspace exposes the dashboard entry point
    [Documentation]    Critical CI check for Gestion de mission.
    [Tags]    critical    smoke    gestion_mission
    Open Domain Route    /app/landingpage
    Sleep    4s
    Wait Until Page Contains    Tableau de board    timeout=30s
