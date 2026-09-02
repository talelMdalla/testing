*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${EmptyErrorMsg}                                                        Ce champ est obligatoire
${Days_per_week_empty_error}                                            Doit avoir au moins 1
${start_time_less_than_end_time_error}                                  La durée d'un interval doit être supérieure ou égale à une heure.
${Start_break_time_must_be_between_start_time_and_end_time_error}       L'heure de début de la pause doit être entre l'heure de début et l'heure de fin
${start_break_time_must_between_start_time_and_end_time}                L'heure de début de la pause doit être entre l'heure de début et l'heure de fin
${start_date_and_less_than_end_date_error}                              la date de debut doit être une date valide

*** Keywords ***
Start date empty error message
    Wait Until Page Contains Element
    ...    xpath=(//*[contains(text(),'${EmptyErrorMsg}')])[1]
    ...    timeout=20s

End date empty error message
    Wait Until Page Contains Element
    ...    xpath=(//*[contains(text(),'${EmptyErrorMsg}')])[2]
    ...    timeout=20s

Days per week empty error message
    Wait Until Page Contains Element
    ...    xpath=//div[contains(@data-test-id,'${Days_per_week_empty_error}')]
    ...    timeout=20s

Start date input
    [Arguments]    ${startDate}
    Click Element    xpath=(//div[@role="group"])[1]
    Press Keys    None    ${startDate}

End date input
    [Arguments]    ${endDate}
    Click Element    xpath=(//div[@role="group"])[2]
    Press Keys    None    ${endDate}

Monday Start time input
    [Arguments]    ${startTime}

    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-0-0"]
    ...    timeout=10s

    Common.Set Text    xpath=//*[@id="start_time-0-0"]    ${startTime}    ${SMALL_RETRY_COUNT}

Monday end time input
    [Arguments]    ${endTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_time-0-0"]
    ...    timeout=10s

    Common.Set Text    xpath=//*[@id="end_time-0-0"]    ${endTime}     ${SMALL_RETRY_COUNT}


Set working days
    Click Element    xpath=//*[@id="select-days"]/div
    Click Element    xpath=//div[@id='react-select-4-option-0']

old start date and less than the end date error message
    Wait Until Element Is Visible
    ...    xpath=//*[contains(normalize-space(.), '${start_date_and_less_than_end_date_error}')]
    ...    timeout=10s
    
start date greater than the end date error message
   Wait Until Element Is Visible    xpath=//*[@data-test-id='date-picker-error']    10s

   Element Should Contain
   ...    xpath=//*[@data-test-id='date-picker-error']
   ...    la date de debut doit être une date valide inferiéur à la date de fin et supérieur à la date d'aujourdhui

start time less than end time error message
    Wait Until Element Is Visible
    ...    xpath=//*[@data-test-id="La durée d'un interval doit être supérieure ou égale à une heure."]
    ...    10s

    Element Should Contain
    ...    xpath=//*[@data-test-id="La durée d'un interval doit être supérieure ou égale à une heure."]
    ...    La durée d'un interval doit être supérieure ou égale à une heure.

Start break time must be between start time and end time error message
    Wait Until Element Is Visible
    ...    xpath=//*[@data-test-id="L'heure de début de la pause doit être entre l'heure de début et l'heure de fin"]
    ...    timeout=10s

    Element Should Contain
    ...    xpath=//*[@data-test-id="L'heure de début de la pause doit être entre l'heure de début et l'heure de fin"]
    ...    ${Start_break_time_must_be_between_start_time_and_end_time_error}

break times not between start and end times error message
    Wait Until Element Is Visible
    ...    xpath=//*[@data-test-id="L'heure de début de la pause doit être entre l'heure de début et l'heure de fin"]
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@data-test-id="L'heure de début de la pause doit être entre l'heure de début et l'heure de fin"]
    ...    ${start_break_time_must_between_start_time_and_end_time}

select days filed
    Click Element    xpath=//*[@id="select-days"]
    Click Element    xpath=//div[contains(@id,'react-select') and contains(@id,'option-0')]    
    Click Element    xpath=//div[contains(@id,'react-select') and contains(@id,'option-1')]    

Click on days per week
    Common.Click Element    xpath=//*[@id="select-days"]  ${SMALL_RETRY_COUNT}

Add break time button
    Wait Until Element Is Visible    xpath=//button[contains(.,'Ajouter une pause')]    10s
    Click Element    xpath=//button[contains(.,'Ajouter une pause')]    ${SMALL_RETRY_COUNT}


Start break time input
    [Arguments]    ${startBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_break_time-0-0"]
    ...    timeout=10s
    Common.Set Text    xpath=//*[@id="start_break_time-0-0"]   ${startBreakTime}   ${SMALL_RETRY_COUNT}

End break time input
    [Arguments]    ${endBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_break_time-0-0"]
    ...    timeout=10s
    Common.Set Text     xpath=//*[@id="end_break_time-0-0"]  ${endBreakTime}    ${SMALL_RETRY_COUNT}

Add interval button
    Click Element    xpath=//button[.//text()[contains(.,'Ajouter un créneau de travail')]]    ${SMALL_RETRY_COUNT}

Seconde Start time
    [Arguments]    ${SecondeStartTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-0-1"]
    ...    timeout=10s

    Common.Set Text   xpath=//*[@id="start_time-0-1"]  ${SecondeStartTime}  ${SMALL_RETRY_COUNT}

Seconde End time
    [Arguments]    ${SecondeEndTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_time-0-1"]
    ...    timeout=10s

    Set Text   xpath=//*[@id="end_time-0-1"]  ${SecondeEndTime}  ${SMALL_RETRY_COUNT}

Delete day
    Click Element    xpath=//*[@id="select-days"]/div/div[1]/div[2]/div[2]/svg ${SMALL_RETRY_COUNT}

# specific keywords for specific test case "validate with two time slots in the same day"

select Monday
    Common.Click Element   xpath=//*[@id="select-days"]/div  ${SMALL_RETRY_COUNT}
    Common.Click Element   xpath=//div[@id='react-select-4-option-0']  ${SMALL_RETRY_COUNT}

Seconde Start time1
    [Arguments]    ${SecondeStartTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[1]/div/div/input
    ...    timeout=10s

    Common.Set Text   xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[1]/div/div/input ${SecondeStartTime} ${SMALL_RETRY_COUNT}

Seconde End time1
    [Arguments]    ${SecondeEndTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[2]/div/div/input
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[2]/div/div/input ${SecondeEndTime} ${SMALL_RETRY_COUNT}

Monday Start time input1
    [Arguments]    ${startTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[1]/div/div/input
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[1]/div/div/input ${startTime} ${SMALL_RETRY_COUNT}

Monday end time input1
    [Arguments]    ${endTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[2]/div/div/input
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[2]/div/div/input ${endTime} ${SMALL_RETRY_COUNT}

Start break time input1
    [Arguments]    ${startBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div/div/input
    ...    timeout=10s
    Common.Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div/div/input ${startBreakTime} ${SMALL_RETRY_COUNT}

End break time input1
    [Arguments]    ${endBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[2]/div/div/input
    ...    timeout=10s
    Common.Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[2]/div/div/input ${endBreakTime} ${SMALL_RETRY_COUNT}
