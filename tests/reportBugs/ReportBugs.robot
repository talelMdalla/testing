*** Settings ***
Documentation       Test cases for the 'Report Bugs' functionality.

Library             SeleniumLibrary
Resource            ../config/CredentialsDetails.robot

Suite Setup         Open Browser    ${URL}    chrome
Suite Teardown      Close Browser


*** Variables ***
${URL}          https://dev.daxme.fr
${EMAIL}        vajayeb494@kaoing.com
${PASSWORD}     123Ghada!


*** Test Cases ***
Report Bug Form - Display and Validation
    [Documentation]    Vérifie l'accès au formulaire de signalement de bugs et la présence des champs obligatoires.
    Maximize Browser Window
    Wait Until Page Contains Element
    ...    xpath=//button[contains(.,'Accepter') or contains(.,'Accept') or contains(.,'cookies')]
    Click Button    xpath=//button[contains(.,'Accepter') or contains(.,'Accept') or contains(.,'cookies')]
    Wait Until Page Contains Element    id=rcc-confirm-button
    Click Button    id=rcc-confirm-button
    Input Text    id=email    ${EMAIL}
    Input Password    id=password    ${PASSWORD}
    Click Button    xpath=//button[contains(.,'Connexion') or contains(.,'Login')]
    Wait Until Page Contains Element    xpath=//img[contains(@class,'profile') or contains(@alt,'profile')]
    Click Element    xpath=//img[contains(@class,'profile') or contains(@alt,'profile')]
    Wait Until Page Contains Element    xpath=//a[contains(.,'Signaler bugs') or contains(.,'Signaler un bug')]
    Click Element    xpath=//a[contains(.,'Signaler bugs') or contains(.,'Signaler un bug')]
    Wait Until Page Contains Element    xpath=//form
    Page Should Contain Element    xpath=//input[@name='title' or @placeholder='Titre' or @required]
    Page Should Contain Element    xpath=//textarea[@name='description' or @placeholder='Description']
    Page Should Contain Element    xpath=//input[@type='file']
    # Vérifier qu'on peut uploader jusqu'à 4 fichiers (si possible)
    # Page Should Contain Element    xpath=(//input[@type='file'])[4]
    [Teardown]    Close Browser
