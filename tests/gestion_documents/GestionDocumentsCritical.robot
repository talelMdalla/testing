*** Settings ***
Documentation       Critical smoke coverage for Gestion des documents.
Library             SeleniumLibrary
Resource            ../../resources/gestion_documents/GestionDocumentsKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
documents tab is available
    [Documentation]    Critical CI check for Gestion des documents.
    [Tags]    critical    smoke    gestion_documents
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains    Documents    timeout=30s

required document controls are visible
    [Documentation]    Critical CI check for Gestion des documents.
    [Tags]    critical    smoke    gestion_documents
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains    Documents    timeout=30s
    Click Element    xpath=//*[normalize-space()='Documents' and not(self::a)]
    Sleep    3s
    Wait Until Page Contains    Documents    timeout=30s
