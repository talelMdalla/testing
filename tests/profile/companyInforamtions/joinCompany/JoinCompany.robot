*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             XML
Resource            ../../../../resources/profile/ProfileKeywords.robot
Resource            ../../../../resources/Keywords.robot
Resource            ../../../../resources/profile/joinCompany/JoinCompanyKeywords.robot
Resource            ../../../../config/CredentialsDetails.robot

Test Teardown       Close Browser


*** Variables ***
${VALID_EMAIL}          ${PROD_EMAIL_COMPANY}
${VALID_PASSWORD}       ${PROD_PASS_COMPANY}


*** Test Cases ***
validate join company with invalid SIRET
    [Tags]    regression
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Access to profile page
    Scroll to company information
    Joindre une entreprise
    SIRET invalid input
    Submit button
    Error invalid SIRET

validate join company with empty field
    [Tags]    regression
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Access to profile page
    Scroll to company information
    Joindre une entreprise
    Submit button
    Empty field error SIRET

validate join company with valid SIRET
    [Tags]    smoke
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Access to profile page
    Scroll to company information
    Joindre une entreprise
    SIRET valid input
    Submit button
    Confirm button
    Success message
    Quit company
    Confirm button
    Success message for quit company
