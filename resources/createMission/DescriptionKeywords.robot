*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${EmptyErrorMsg}        Ce champ est obligatoire
${3caracterError}       Ce champ doit contenir au moins 3 caractères
${AgentNumberError}     doit être un nombre positif inférieur à 124


*** Keywords ***
Create mission button
    Wait Until Element Is Visible    xpath=//*[@id="chip_create_mission"]    timeout=10s
    Click Element    xpath=//*[@id="chip_create_mission"]    ${SMALL_RETRY_COUNT}
    
Next button
    Wait Until MUI Is Idle
    Execute JavaScript    document.querySelector('button.btn_orange').scrollIntoView({block: 'center'})
    Wait Until MUI Is Idle
    Execute JavaScript    window.scrollBy(0, -150)
    Wait Until MUI Is Idle
    Execute JavaScript    document.querySelector('button.btn_orange').click()

Empty mission name error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Element Text Should Contain    xpath=//*[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty mission type error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty gender error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty level error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty adress error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

One caracter error message name
    Wait Until Page Contains    ${3caracterError}    timeout=20s
    Wait Until Element Is Visible    xpath=//div[contains(text(), '${3caracterError}')]    timeout=20s
    Element Text Should Contain    xpath=//div[contains(text(), '${3caracterError}')]    ${3caracterError}    ${SMALL_RETRY_COUNT}

One caracter error message description
    Wait Until Page Contains    ${3caracterError}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${3caracterError}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${3caracterError}')]    ${3caracterError}    ${SMALL_RETRY_COUNT}

Maximum agent error message
    Wait Until Page Contains    ${AgentNumberError}    timeout=20s
    Wait Until Element Is Visible    xpath=//div[contains(text(), '${AgentNumberError}')]    timeout=20s
    Element Text Should Contain    xpath=//div[contains(text(), '${AgentNumberError}')]    ${AgentNumberError}    ${SMALL_RETRY_COUNT}

Mission name input
    [Arguments]    ${MissionName}
    Wait Until Element Is Visible    xpath=//*[@id="mission_name_input"]    timeout=10s
    Input Text    xpath=//*[@id="mission_name_input"]    ${MissionName}

Mission description input
    [Arguments]    ${description}
    Wait Until Element Is Visible    xpath=//*[@id="desc_txt__update__agent"]    timeout=10s
    Input Text    xpath=//*[@id="desc_txt__update__agent"]    ${description}

Agent number input
    [Arguments]    ${AgentNumber}
    Wait Until Element Is Visible    xpath=//*[@name="agent_number"]    timeout=10s
    Input Text    xpath=//*[@name="agent_number"]    ${AgentNumber}

Mission type input
    [Arguments]    ${MissionType}=Type 1

    Wait Until Page Contains Element    xpath=//input[@id='react-select-2-input']    timeout=10s

    Click Element    xpath=//div[@id='select-types']

    Wait Until Element Is Visible    xpath=//div[@id='react-select-2-option-0']    timeout=10s
    Click Element    xpath=//div[@id='react-select-2-option-0']


Select company type from listes
    [Arguments]    ${CompanyType}=Type 1

    Wait Until Page Contains Element    xpath=//div[@id='select-types']    timeout=10s

    Click Element    xpath=(//div[contains(@class,'css-b62m3t-container')])[2]

    Wait Until Element Is Visible    xpath=//div[@id='react-select-3-option-0']    timeout=10s

    Click Element    xpath=//div[@id='react-select-3-option-0']

Gender checkbox
    Capture Page Screenshot    before_gender.png

    Wait Until MUI Is Idle

    ${element_found}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    xpath=//*[@test-id="homme"]
    ...    timeout=5s

    IF    ${element_found}
        Wait Until Element Is Enabled    xpath=//*[@test-id="homme"]    timeout=5s
        Click Element    xpath=//*[@test-id="homme"]
    ELSE
        Log    Gender checkbox not found
    END

    Wait Until MUI Is Idle

Level checkbox
    Capture Page Screenshot    before_level.png

    Wait Until MUI Is Idle

    ${element_found}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    xpath=//*[@test-id="labels:level1"]
    ...    timeout=5s

    IF    ${element_found}
        Wait Until Element Is Enabled    xpath=//*[@test-id="labels:level1"]    timeout=5s
        Click Element    xpath=//*[@test-id="labels:level1"]
    ELSE
        Log    Level checkbox not found
    END

    Wait Until MUI Is Idle
    
Address input
    [Arguments]    ${Address}=chat

    Wait Until MUI Is Idle

    Wait Until Element Is Visible
    ...    xpath=(//input[contains(@id,'react-select')])[last()]
    ...    timeout=10s

    Click Element
    ...    xpath=(//input[contains(@id,'react-select')])[last()]

    Input Text
    ...    xpath=(//input[contains(@id,'react-select')])[last()]
    ...    ${Address}

    Wait Until Element Is Visible
    ...    xpath=//div[contains(@id,'react-select') and contains(@id,'option-0')]
    ...    timeout=10s

    Wait Until MUI Is Idle

    Click Element
    ...    xpath=//div[contains(@id,'react-select') and contains(@id,'option-0')]

    Wait Until MUI Is Idle

Verify description step
    Wait Until Page Contains Element    xpath=//*[@id="info_ctn"]    timeout=15s
    Scroll Element Into View            xpath=//*[@id="info_ctn"]
    Wait Until Element Is Visible       xpath=//*[@id="info_ctn"]    timeout=10s

Verify schedule step
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Ajustement des horaires')]    20s
    Wait Until Element Is Visible           xpath=//span[contains(text(),'Ajustement des horaires')]    10s

Scroll to bottom
    Press Key    xpath=//body    END