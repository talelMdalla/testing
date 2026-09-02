*** Settings ***
Library     SeleniumLibrary
Resource    ../../Common.robot


*** Variables ***
${Empty_filed_error}                Ce champ est obligatoire
${Success_Msg}                      Entreprise créée avec succès
${success_Quit company error}       vous avez quitté l'entreprise

${InvalidSIRET}                     12000044500013
${validSIRET}                       10000000900017


*** Keywords ***
Access to profile page
    Common.Click Element    xpath://button[@data-test-id="photo_profile"]   ${SMALL_RETRY_COUNT}
    Common.Click Element    xpath://*[@id="drop"]/button[1]     ${SMALL_RETRY_COUNT}

Scroll To Company Information
    Execute JavaScript    window.scrollBy(0, 1900)
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="J'ai une entreprise de sécurité"]    10s

Create company button
    ${LOCATOR}=    Set Variable    xpath=//span[normalize-space(.)="J'ai une entreprise de sécurité"]/ancestor::div[contains(@class,"card-ctn")]
    Wait Until Element Is Visible    ${LOCATOR}    10s
    Scroll Element Into View    ${LOCATOR}
    Common.Click Element    ${LOCATOR}

Company name input
    Common.Set Text    xpath=//*[@data-test-id="company_name"]    TestCompany    ${SMALL_RETRY_COUNT}

Company ID input
    Common.Set Text    xpath://*[@data-test-id="company_siret"]  ${InvalidSIRET}  ${SMALL_RETRY_COUNT}

SIRET valid input
    Common.Set Text    xpath=//*[@data-test-id="company_siret"]    ${validSIRET}    ${SMALL_RETRY_COUNT}

Scroll to submit button
    Execute JavaScript
    ...    var el = document.evaluate("//button[normalize-space(.)='Soumettre' and not(@disabled)]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    if(el){el.scrollIntoView({block:'center'});}
    Wait Until Element Is Visible    xpath=//button[normalize-space(.)="Soumettre" and not(@disabled)]    10s

Submit button
    Wait Until Element Is Visible
    ...    xpath=//button[normalize-space(.)="Soumettre" and not(@disabled)]
    ...    10s
    Common.Click Element
    ...    xpath=//button[normalize-space(.)="Soumettre" and not(@disabled)]

Confirm button
    Wait Until Element Is Visible    xpath=//div[@role='dialog']//button[@class='btn_orange' and normalize-space()='Confirmer']    10s
    Common.Click Element                    xpath=//div[@role='dialog']//button[@class='btn_orange' and normalize-space()='Confirmer']

Seconde confirm button
   Wait Until Keyword Succeeds    ${SMALL_RETRY_COUNT}    ${RETRY_DELAY}
   ...    Click Element    //button[contains(@class,'btn_orange') and normalize-space()='Confirmer']

Empty company name error
    Wait Until Element Is Visible    xpath=//div[@data-test-id="Ce champ est obligatoire"]    10s
    Element Text Should Be    xpath=//div[@data-test-id="Ce champ est obligatoire"]    ${Empty_filed_error}    ${SMALL_RETRY_COUNT}
    
Empty company ID error
    Wait Until Element Is Visible    xpath=//div[@data-test-id="Ce champ est obligatoire"]    10s
    Element Text Should Be    xpath=//div[@data-test-id="Ce champ est obligatoire"]    Ce champ est obligatoire    ${SMALL_RETRY_COUNT}

Empty company type error
    Wait Until Element Is Visible    xpath=//div[@data-test-id="Ce champ est obligatoire"]    10s
    Element Text Should Be    xpath=//div[@data-test-id="Ce champ est obligatoire"]    ${Empty_filed_error}    ${SMALL_RETRY_COUNT}

Success message
    Wait Until Element Is Visible    xpath=//div[@role='alert' and contains(@class,'Toastify__toast--success')]    10s
    Element Text Should Contain   xpath=//div[@role='alert' and contains(@class,'Toastify__toast--success')]  ${Success_Msg}    ${SMALL_RETRY_COUNT}

Select company type from liste
    Select From List By Value    id:company__input    9

Quitter l'entreprise button
    Click Element    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[3]/div/button

success quit company error
    Element Text Should Be   xpath://*[@id="vous avez quitté l'entreprise"] ${success_Quit company error} ${SMALL_RETRY_COUNT}

Seconde confirm button for quit company
    Wait Until Element Is Visible    css:.btn__confirm.btn.btn-secondary    10s
    Click Element    css:.btn__confirm.btn.btn-secondary
