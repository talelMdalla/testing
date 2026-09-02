*** Settings ***
Library     SeleniumLibrary
Resource    ../../../config/SeleniumConfigs.robot
Resource    ../../../resources/Common.robot
Resource    ../../../config/CredentialsDetails.robot


*** Variables ***
${SIRETinvalide}    ce champ doit contenir 14 caractères
${EmptySIRET}       Ce champ est obligatoire
${ValidSIRET}       tu as rejoint l'entreprise avec succés
${QuitSucessMsg}    Vous avez quitté l'entreprise
${JoinSucessMsg}    Vous avez rejoint l'entreprise avec succés


*** Keywords ***
Access to profile page
    Click Element   xpath://button[@data-test-id="photo_profile"]   ${SMALL_RETRY_COUNT}
    Click Element   xpath://*[@id="drop"]/button[1]   ${SMALL_RETRY_COUNT}

Joindre une entreprise
    ${LOCATOR}=    Set Variable    xpath=//span[normalize-space(.)="Je me rattache à une entreprise inscrite sur DAXme"]/ancestor::div[contains(@class,"card-ctn")]
    Wait Until Element Is Visible    ${LOCATOR}    10s
    Scroll Element Into View    ${LOCATOR}
    Click Element    ${LOCATOR}

SIRET invalid input
    Input Text    xpath=//*[@id="company__input3"]    77021502
    Press Keys    xpath=//*[@id="company__input3"]    TAB

SIRET valid input
    Wait Until Element Is Visible    xpath=//*[@id="company__input3"]    10s
    Clear Element Text               xpath=//*[@id="company__input3"]
    Input Text                       xpath=//*[@id="company__input3"]    ${TEST_SIRET}

Submit button
    ${locator}=    Set Variable    xpath=//button[contains(normalize-space(.),"Soumettre") and not(@disabled)]

    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s

    ${element}=    Get WebElement    ${locator}

    Execute JavaScript
    ...    arguments[0].scrollIntoView({block: 'center'});
    ...    ARGUMENTS
    ...    ${element}

    Sleep    0.5s

    Execute JavaScript
    ...    arguments[0].click();
    ...    ARGUMENTS
    ...    ${element}
    
Scroll To Company Information
    Execute JavaScript    window.scrollBy(0, 1900)
    Sleep    0.5s

Confirm button
    ${locator}=    Set Variable    xpath=//div[@role='dialog']//button[contains(normalize-space(.),"Confirmer")]

    Wait Until Element Is Visible    xpath=//div[@role='dialog']    10s
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s

    SeleniumLibrary.Scroll Element Into View    ${locator}
    Sleep    0.5s

    SeleniumLibrary.Click Element    ${locator}

       
Error invalid SIRET
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class,'invalid-feedback')]
    ...    5s

    Element Should Contain
    ...    xpath=//div[contains(@class,'invalid-feedback')]
    ...    ce champ doit contenir 14 caractères

Empty field error SIRET
    Wait Until Element Is Visible    xpath=//div[@data-test-id="Ce champ est obligatoire"]    10s
    Element Text Should Be    xpath=//div[@data-test-id="Ce champ est obligatoire"]   ${EmptySIRET}  ${SMALL_RETRY_COUNT}


Success message
    Element Text Should Contain   xpath=//div[@role='alert' and contains(@class,'Toastify__toast--success')]  ${JoinSucessMsg}   ${SMALL_RETRY_COUNT}

Quit company
    ${locator}=    Set Variable    xpath=//button[contains(normalize-space(.),"Quitter")]

    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s

    SeleniumLibrary.Scroll Element Into View    ${locator}
    Sleep    0.5s

    SeleniumLibrary.Click Element    ${locator}

Success message for quit company
     Element Text Should Contain   xpath=//div[@role='alert' and contains(@class,'Toastify__toast--success')]  ${QuitSucessMsg}   ${SMALL_RETRY_COUNT}
