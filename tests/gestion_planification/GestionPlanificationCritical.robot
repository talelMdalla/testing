*** Settings ***
Documentation       Critical smoke coverage for Gestion de planification.
Library             SeleniumLibrary
Resource            ../../resources/gestion_planification/GestionPlanificationKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
planning page is available
    [Documentation]    Critical CI check for Gestion de planification.
    [Tags]    critical    smoke    gestion_planification
    Open Domain Route    /app/mycalendar
    Sleep    4s
    Wait Until Page Contains    Mon planning    timeout=30s

planning page exposes calendar content
    [Documentation]    Critical CI check for Gestion de planification.
    [Tags]    critical    smoke    gestion_planification
    Open Domain Route    /app/mycalendar
    Sleep    4s
    Wait Until Page Contains Element    xpath=//*[contains(@class,'calendar') or contains(@class,'planning') or contains(text(),'Planning') or contains(text(),'planning')]    timeout=30s
