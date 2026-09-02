*** Settings ***
Documentation       Test cases for create mission functionality.

Library             Collections
Library             SeleniumLibrary
Resource            ../Keywords.robot
Resource            ./WorkingDaysKeywords.robot


*** Variables ***
${URL}                          https://dev.daxme.fr/
${BROWSER}                      Chrome
${expectedLandingPageUrl}       [https://dev.daxme.fr/landingpage,https://dev.daxme.fr/dashboard]
${DELAY_IN_SECONDS}             1
@{days}                         Lundi    Mardi    Mercredi    Jeudi    Vendredi    Samedi    Dimanche

@{xpathsErrorMsg30min}          xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[2]/div[2]/div[2]


*** Keywords ***
Verify Empty Field Errors For All Fields
    ${errors}=    Get WebElements    xpath=//div[@data-test-id="Ce champ est obligatoire"]

    Length Should Be    ${errors}    14

    FOR    ${error}    IN    @{errors}
        Element Should Contain    ${error}    Ce champ est obligatoire
    END

Validate Errors for start time grater than end time
    ${days_length}=    Get Length    ${days}

    FOR    ${index}    IN RANGE    0    ${days_length}

        ${day}=    Get From List    ${days}    ${index}

        ${xpath}=    Set Variable
        ...    xpath=//*[contains(text(),"${day}")]/ancestor::div[contains(@class,"mb-1")]/following::div[contains(@class,"invalid-feedback")][1]

        Log    Validating error for ${day}

        Scroll Element Into View    ${xpath}

        Wait Until Element Is Visible    ${xpath}    10s

        Element Should Contain
        ...    ${xpath}
        ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

    END

Validate Errors under 30min
    ${days_length}=    Get Length    ${days}

    FOR    ${index}    IN RANGE    0    ${days_length}

        ${day}=    Get From List    ${days}    ${index}

        ${xpath}=    Set Variable
        ...    xpath=//*[contains(text(),"${day}")]/ancestor::div[contains(@class,"mb-1")]/following::div[contains(@class,"invalid-feedback")][1]

        Log    Validating 1 hour error for ${day}

        Scroll Element Into View    ${xpath}

        Wait Until Element Is Visible    ${xpath}    10s

        Element Should Contain
        ...    ${xpath}
        ...    La durée d'un interval doit être supérieure ou égale à une heure.

    END
