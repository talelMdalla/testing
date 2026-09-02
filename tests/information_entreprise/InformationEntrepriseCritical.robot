*** Settings ***
Documentation       Critical smoke coverage for Information d'entreprise.
Library             SeleniumLibrary
Resource            ../../resources/information_entreprise/InformationEntrepriseKeywords.robot

Suite Setup         Login As Critical Agent
Suite Teardown      Close All Browsers
Test Teardown       Go To    ${APP_BASE_URL}/app/landingpage

*** Test Cases ***
company information starts from the profile area
    [Documentation]    Critical CI check for Information d'entreprise.
    [Tags]    critical    smoke    information_entreprise
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains    Profil    timeout=30s

profile page exposes the document step
    [Documentation]    Critical CI check for Information d'entreprise.
    [Tags]    critical    smoke    information_entreprise
    Open Domain Route    /app/profile
    Sleep    4s
    Wait Until Page Contains    Documents    timeout=30s
