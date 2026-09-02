*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             XML
Resource            ../../../../resources/profile/ProfileKeywords.robot
Resource            ../../../../resources/Keywords.robot
Resource            ../../../../resources/profile/createCompnay/CreateCompanyKeywords.robot
Resource            ../../../../config/CredentialsDetails.robot

Test Teardown       Close Browser


*** Variables ***
${VALID_EMAIL}          tokise2154@bezill.com
${VALID_PASSWORD}       123Ghada!

${VALID_EMAIL1}         ${TEST_EMAIL_COMPANY}
${VALID_PASSWORD1}      ${TEST_PASS_COMPANY}


*** Test Cases ***
validate create company with empty field
    [Tags]    regression
    Login with credentials    ${VALID_EMAIL1}    ${VALID_PASSWORD1}
    Access to profile page 
    Scroll to company information
    Create company button
    Scroll to submit button
    Submit button
    Empty company name error
    Empty company ID error
    Empty company type error

validate create company with invalid SIRET
    [Tags]    regression
    Login with credentials    ${VALID_EMAIL1}    ${VALID_PASSWORD1}
    Access to profile page
    Scroll to company information
    Create company button
    Company name input
    Company ID input
    Select company type from liste
    Scroll to submit button
    Submit button
    #Seconde confirm button

validate create company with valid SIRET
    [Tags]    smoke
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Access to profile page
    Scroll to company information
    Create company button
    Company name input
    SIRET valid input
    Select company type from liste
    Scroll to submit button
    Submit button
    #Seconde confirm button
    #Success message

********Keywords********

Access to profile
    Login with credentials    ${VALID_EMAIL1}    ${VALID_PASSWORD1}
    Access to profile page
    Scroll to company information
    Create company button
    Company name input
