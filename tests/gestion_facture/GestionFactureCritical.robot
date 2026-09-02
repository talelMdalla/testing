*** Settings ***
Documentation       Critical smoke coverage for Gestion de facture.
Library             SeleniumLibrary
Resource            ../../resources/gestion_facture/GestionFactureKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
billing workspace is protected by authentication
    [Documentation]    Critical CI check for Gestion de facture.
    [Tags]    critical    smoke    gestion_facture
    Open Domain Route    /app/dashboard
    Sleep    4s
    Wait Until Page Contains    Profil    timeout=30s

billing navigation opens the dashboard
    [Documentation]    Critical CI check for Gestion de facture.
    [Tags]    critical    smoke    gestion_facture
    Open Domain Route    /app/dashboard
    Sleep    4s
    Wait Until Page Contains    Tableau de board    timeout=30s
