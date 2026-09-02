*** Settings ***
Documentation       Test cases for create mission functionality.

Library             SeleniumLibrary
Resource            ../../resources/createMission/DescriptionKeywords.robot
Resource            ../../resources/createMission//ScheduleKeywords.robot
Resource            ../../resources/Keywords.robot
Resource            ../../config/CredentialsDetails.robot
Resource            ../../resources/createMission/AdjustmentSchedulesKeywords.robot

Test Teardown       Close Browser


*** Variables ***
${email}                ${TEST_EMAIL_CREATE_MISSION}
${passwrod}             ${TEST_PASS_CREATE_MISSION}
${DELAY_IN_SECONDS}     2


*** Test Cases ***
Validate description step with empty fields
    [Documentation]    First step "Description"
    [Tags]    regression
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Scroll to bottom
    Next button
    Empty mission name error message
    Empty mission type error message
    Empty gender error message
    Empty level error message
    Empty adress error message   #valide

Validate with a single character in the name and description fields
    [Documentation]    First step "Description"
    [Tags]    regression
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Mission name input    a
    Mission description input    a
    Scroll to bottom
    Next button
    one caracter error message name
    one caracter error message description   #valide

validate with an agent number greater than 124
    [Documentation]    First step "Description"
    [Tags]    regression
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Agent number input    290
    Scroll to bottom
    Next button
    maximum agent error message     #valide

validate description form with valid data
    [Documentation]    First step "Description"
    [Tags]    smoke
    First step description

Validate schedule step with empty fields
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description
    Next button
    Start date empty error message
    End date empty error message
    Days per week empty error message

validate with an old start date and less than the end date
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description
    Start date input    12072024    
    End date input      25072024
    Next button
    old start date and less than the end date error message

validate with start time less than end time
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description
    Start date input    01012030
    End date input      10012030
    select days filed
    Click on days per week
    Monday Start time input    08:00
    Monday end time input      08:00
    Next button
    Sleep    2s    reason=waiting error to popup
    start time less than end time error message

validate with break time less than 30 min
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description    
    Start date input    01012030
    End date input      10012030
    select Monday
    Click on days per week
    Monday Start time input    09:00
    Monday end time input      12:00
    Add break time button
    Start break time input    08:00
    End break time input      10:00  
    Sleep      2s
    Start break time must be between start time and end time error message

validate with two time slots in the same day
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description
    Start date input    01012030
    End date input      10012030
    select Monday
    Monday Start time input    09:00
    Monday end time input      18:00
    Add interval button
    Scroll to bottom
    Seconde Start time    19:00
    Seconde End time    20:00
    Next button
    Wait Until Element Is Visible    locator=//*[@id="info_ctn"]/div

validate with break times not between start and end times
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description
    Start date input    01012030
    End date input    10012030
    select Monday
    Click on days per week
    Monday Start time input    09:00
    Monday end time input      18:00
    Add break time button
    Start break time input    08:00
    End break time input      10:10
    Next button
    break times not between start and end times error message

validate with two overlapping slots
    [Documentation]    Second step "schedule"
    [Tags]    regression
    First step description
    Start date input    01012030
    End date input    10012030
    select Monday
    Click on days per week
    Monday Start time input    09:00
    Monday end time input    18:00
    Add break time button
    Start break time input    10:05
    End break time input      10:10
    Add interval button
    Scroll to bottom
    Seconde Start time    19:00
    Seconde End time      20:00
    Next button
    Wait Until Element Is Visible    locator=//*[@id="info_ctn"]/div

validate schedule form with valid data
    [Documentation]    Second step "schedule"
    [Tags]    smoke
    First step description
    Start date input    01012030
    End date input      10012030
    Set working days
    Monday Start time input    09:00
    Monday end time input     18:00
    Add break time button
    Start break time input    13:00
    End break time input      14:00
    Next button
    Sleep    2s
    Verify schedule step

validate schedule update with only days off
    [Documentation]    third step "Working hours"
    [Tags]    regression
    Second step schedule
    Next week button
    Card of day selected
    Day off check box
    Update button
    Scroll To The Bottom Of The Page
    Step3 Next button
    Confirm Financial information modal
    Create mission with all days off error

validate schedule update with one days off
    [Documentation]    third step "Working hours"
    [Tags]    regression
    Second step schedule1
    Next week button
    Card of day selected
    Day off check box
    Update button
    Scroll To The Bottom Of The Page
    Step3 Next button
    Confirm Financial information modal
    Verif create mission with one day off



*** Keywords ***

First step description
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Mission name input    hamza
    Mission type input
    Select company type from listes
    Gender checkbox
    Level checkbox
    Address input    chat
    Scroll to bottom
    Next button
    Verify description step

Second step schedule
    First step description
    Start date input    01012030
    End date input    10012030
    Set working days
    Monday Start time input    09:00
    Monday end time input    18:00
    Next button
    Sleep    2s
    Verify schedule step

Second step schedule1
    First step description
    Start date input    01012030
    End date input    10012030
    Select two days
    Monday Start time input    09:00
    Monday end time input    18:00
    Tuesday start time    09:00
    Tuesday end time    18:00
    Next button
    Sleep    2s
    Verify schedule step
