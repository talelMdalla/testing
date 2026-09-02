*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${URL}                          https://dev.daxme.fr/
${BROWSER}                      Chrome
${expectedLandingPageUrl}       [https://dev.daxme.fr/landingpage,https://dev.daxme.fr/dashboard]
${DELAY_IN_SECONDS}             1

${LundiXpath}                   xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]
${MardiXpath}                   xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]
${MercrediXpath}                xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[2]/div[1]/div[2]
${JeudiXpath}                   xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/div[2]
${VendrediXpath}                xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]
${SamediXpath}                  xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]
${DimancheXpath}                xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[2]/div[1]/div[2]


*** Keywords ***
PlanningButton
    Click Element    xpath://*[@data-test-id="link-myCalendar-navbar"]

EnterMyAvailabilityButton
    Wait Until Element Is Visible    xpath=//button[@data-test-id="button-editSchedule-myCalendar"]    10s
    Click Element    xpath=//button[@data-test-id="button-editSchedule-myCalendar"]

LundiButton
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Lundi']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Lundi']/span/span

MardiButton
    Execute JavaScript    window.scrollBy(0,400)
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Mardi']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Mardi']/span/span

MercrediButton
    Execute JavaScript    window.scrollBy(0,400)
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Mercredi']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Mercredi']/span/span

JeudiButton
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Jeudi']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Jeudi']/span/span

VendrediButton
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Vendredi']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Vendredi']/span/span

SamediButton
    Execute JavaScript    window.scrollBy(0,400)
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Samedi']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Samedi']/span/span

DimancheButton
    Wait Until Element Is Visible    xpath=//div[normalize-space()='Dimanche']/span/span    10s
    Click Element    xpath=//div[normalize-space()='Dimanche']/span/span

ValidateButton
    Click Button    xpath=//button[@type='submit' and contains(.,'Valider')]

Empty filed error message
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]
    ...    Ce champ est obligatoire


Lundi start time input
    [Arguments]    ${time}

    ${picker}=    Set Variable
    ...    xpath=//div[.//text()[normalize-space()='Lundi']]//input[@name='start_time']/preceding-sibling::div//span[@aria-label='Hours']

    Wait Until Element Is Visible    ${picker}    10s
    Click Element                    ${picker}

    Press Keys    None    CTRL+a
    Press Keys    None    BACKSPACE
    Press Keys    None    ${time}
    Press Keys    None    TAB


Lundi end time input
    [Arguments]    ${time}

    ${picker}=    Set Variable
    ...    xpath=//div[.//text()[normalize-space()='Lundi']]//input[@name='end_time']/preceding-sibling::div//span[@aria-label='Hours']

    Wait Until Element Is Visible    ${picker}    10s
    Click Element                    ${picker}

    Press Keys    None    CTRL+a
    Press Keys    None    BACKSPACE
    Press Keys    None    ${time}
    Press Keys    None    TAB

Mardi Start Time Input
    [Arguments]    ${startTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Mardi")]]/following-sibling::div//span[@aria-label="Hours"])[1]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${startTime}


Mardi End Time Input
    [Arguments]    ${endTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Mardi")]]/following-sibling::div//span[@aria-label="Hours"])[2]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${endTime}

Mercredi Start Time Input
    [Arguments]    ${MercrediStartTime}

    Execute JavaScript    window.scrollBy(0,400)

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Mercredi")]]/following-sibling::div//span[@aria-label="Hours"])[1]
  
    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${MercrediStartTime}


Mercredi End Time Input
    [Arguments]    ${MercrediEndTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Mercredi")]]/following-sibling::div//span[@aria-label="Hours"])[2]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${MercrediEndTime}


Jeudi Start Time Input
    [Arguments]    ${JeudiStartTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Jeudi")]]/following-sibling::div//span[@aria-label="Hours"])[1]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${JeudiStartTime}


Jeudi End Time Input
    [Arguments]    ${JeudiEndTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Jeudi")]]/following-sibling::div//span[@aria-label="Hours"])[2]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${JeudiEndTime}


Vendredi Start Time Input
    [Arguments]    ${VendrediStartTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Vendredi")]]/following-sibling::div//span[@aria-label="Hours"])[1]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${VendrediStartTime}


Vendredi End Time Input
    [Arguments]    ${VendrediEndTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Vendredi")]]/following-sibling::div//span[@aria-label="Hours"])[2]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${VendrediEndTime}


Samedi Start Time Input
    [Arguments]    ${SamediStartTime}
    Execute JavaScript    window.scrollBy(0,400)
    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Samedi")]]/following-sibling::div//span[@aria-label="Hours"])[1]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${SamediStartTime}

Samedi Start Time Input2
    [Arguments]    ${SamediStartTime}
    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Samedi")]]/following-sibling::div//span[@aria-label="Hours"])[1]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${SamediStartTime}


Samedi End Time Input
    [Arguments]    ${SamediEndTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Samedi")]]/following-sibling::div//span[@aria-label="Hours"])[2]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${SamediEndTime}


Dimanche Start Time Input
    [Arguments]    ${DimancheStartTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Dimanche")]]/following-sibling::div//span[@aria-label="Hours"])[1]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${DimancheStartTime}


Dimanche End Time Input
    [Arguments]    ${DimancheEndTime}

    ${xpath}=    Set Variable    xpath=(//div[contains(@class,"mb-1")][.//*[contains(text(),"Dimanche")]]/following-sibling::div//span[@aria-label="Hours"])[2]

    Wait Until Element Is Visible    ${xpath}    10s
    Click Element    ${xpath}
    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${DimancheEndTime}

Lundi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Mardi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Mercredi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Jeudi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Vendredi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Samedi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Dimanche Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Add time slots button for monday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Lundi")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Add time slots button for Tuesday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Mardi")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Add time slots button for Wednesday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Mercredi")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Add time slots button for Thursday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Jeudi")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Add time slots button for Friday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Vendredi")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Add time slots button for Saturday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Samedi")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]
    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Add time slots button for Sunday
    ${xpath}=    Set Variable
    ...    xpath=//*[contains(text(),"Dimanche")]/ancestor::div[contains(@class,"mb-1")]//button[contains(.,"Ajouter un créneau de travail")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

Seconde Lundi start time
    [Arguments]    ${LundiStartTimeSeconde}

    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Lundi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${LundiStartTimeSeconde}

Seconde Lundi end time
    [Arguments]    ${LundiEndTimeSeconde}

    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Lundi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${LundiEndTimeSeconde}

Seconde Mardi start time
    [Arguments]    ${MardiStartTimeSeconde}
    
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Mardi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${MardiStartTimeSeconde}

Seconde Mardi end time
    [Arguments]    ${MardiEndTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Mardi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${MardiEndTimeSeconde}

Seconde Mercredi start time
    [Arguments]    ${MercrediStartTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Mercredi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${MercrediStartTimeSeconde}
    ...    ${MercrediStartTimeSeconde}

Seconde Mercredi end time
    [Arguments]    ${MercrediEndTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Mercredi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${MercrediEndTimeSeconde}

Seconde Jeudi start time
    [Arguments]    ${JeudiStartTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Jeudi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${JeudiStartTimeSeconde}

Seconde Jeudi end time
    [Arguments]    ${JeudiEndTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Jeudi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${JeudiEndTimeSeconde}

Seconde Vendredi start time
    [Arguments]    ${VendrediStartTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Vendredi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${VendrediStartTimeSeconde}

Seconde Vendredi end time
    [Arguments]    ${VendrediEndTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Vendredi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${VendrediEndTimeSeconde}

Seconde Samedi start time
    [Arguments]    ${SamediStartTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Samedi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${SamediStartTimeSeconde}

Seconde Samedi end time
    [Arguments]    ${SamediEndTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Samedi")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${SamediEndTimeSeconde}

Seconde Dimanche start time
    [Arguments]    ${DimancheStartTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Dimanche")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[3]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${DimancheStartTimeSeconde}

Seconde Dimanche end time
    [Arguments]    ${DimancheEndTimeSeconde}
    ${xpath}=    Set Variable
    ...    xpath=(//*[contains(text(),"Dimanche")]/ancestor::div[contains(@class,"mb-1")]/following::span[@aria-label="Hours"])[4]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Click Element    ${xpath}

    Press Keys    NONE    CTRL+a
    Press Keys    NONE    BACKSPACE
    Press Keys    NONE    ${DimancheEndTimeSeconde}

Scroll to bottom
    Press Key    xpath=//body    \ue00f

Overlap error message
    Execute JavaScript    window.scrollBy(0,400)
    ${xpath}=    Set Variable
    ...    xpath=//div[contains(@class,"invalid-feedback") and contains(.,"Les plages horaires ne doivent pas se chevaucher")]

    Scroll Element Into View    ${xpath}

    Wait Until Element Is Visible    ${xpath}    10s

    Element Should Contain
    ...    ${xpath}
    ...    Les plages horaires ne doivent pas se chevaucher.

less thant 1h error message
    Wait Until Element Is Visible
    ...    xpath://*[@data-test-id="La durée d'un interval doit être supérieure ou égale à une heure."]
    Element Should Contain
    ...    xpath://*[@data-test-id="La durée d'un interval doit être supérieure ou égale à une heure."]
    ...    La durée d'un interval doit être supérieure ou égale à une heure.

Invalid Time Range Error
    Wait Until Element Is Visible
    ...    xpath://*[@data-test-id="L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant."]
    Element Should Contain
    ...    xpath://*[@data-test-id="L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant."]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Success message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="Planning modifié avec succès"]

    Element Should Contain
    ...    xpath=//*[@id="Planning modifié avec succès"]
    ...    Planning modifié avec succès