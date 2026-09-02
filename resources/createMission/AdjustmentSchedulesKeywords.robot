*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Common.robot


*** Variables ***
${All_DAYS_OFF_ERROR_MSG}       La création d'une mission avec seulement des jours de congés est impossible


*** Keywords ***
Next week button
    Wait Until Element Is Visible    xpath=//*[@id="Calendar__Day"]/button[2]    10s
    Click Element    xpath=//*[@id="Calendar__Day"]/button[2]    ${SMALL_RETRY_COUNT}

Card of day selected
    Wait Until Element Is Visible    xpath=//div[contains(@class,'rbc-event-content')]    10s
    Click Element    xpath=//div[contains(@class,'rbc-event-content')]  ${SMALL_RETRY_COUNT}
    
Day off check box
    Wait Until Element Is Visible    xpath=//label[contains(.,'Marquer comme un jour de fermeture')]    10s
    Click Element                    xpath=//label[contains(.,'Marquer comme un jour de fermeture')]    ${SMALL_RETRY_COUNT}

Update button
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn_orange') and normalize-space()='Modifier']    10s
    Click Element    xpath=//button[contains(@class,'btn_orange') and normalize-space()='Modifier']   ${SMALL_RETRY_COUNT}

Step3 Next button
    Click Element    xpath=//*[@id="Groupe_Buttons_Step"]/button[2]   ${SMALL_RETRY_COUNT}

Confirm Financial information modal
   Wait Until Element Is Visible    xpath=//button[contains(@class,'btn_orange') and normalize-space()='Confirmer']    10s
   Click Element    xpath=//button[contains(@class,'btn_orange') and normalize-space()='Confirmer']   ${SMALL_RETRY_COUNT}

Create mission with all days off error
    Wait Until Element Is Visible    css:div.Toastify__toast    10s
    Element Should Contain           css:div.Toastify__toast    ${All_DAYS_OFF_ERROR_MSG}

Select two days
    Click Element    xpath=//*[@id="select-days"]/div    ${SMALL_RETRY_COUNT}
    Click Element    xpath=//*[@id="react-select-4-option-0"]    ${SMALL_RETRY_COUNT}
    Click Element    xpath=//*[@id="react-select-4-option-1"]    ${SMALL_RETRY_COUNT}

Tuesday start time
    [Arguments]    ${TuesdayStartTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-1-0"]
    ...    timeout=10s

    Common.Set Text     xpath=//*[@id="start_time-1-0"]   ${TuesdayStartTime}   ${SMALL_RETRY_COUNT}

Tuesday end time
    [Arguments]    ${TuesdayendTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_time-1-0"]
    ...    timeout=10s

    Common.Set Text    xpath=//*[@id="end_time-1-0"]    ${TuesdayendTime}   ${SMALL_RETRY_COUNT}

Verif create mission with one day off
    Element Should Be Visible    xpath=//*[@id="Groupe_Buttons_Step"]/button     10s
