*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Keywords ***
# Ajoutez ici les mots-clés pour la gestion du formulaire de signalement de bugs.

Accepter Les Cookies
    Button Cookies

Remplir Champ Email
    [Arguments]    ${email}
    Set Text [Arguments] id:email ${email} ${SMALL_RETRY_COUNT}

Remplir Champ Mot De Passe
    [Arguments]    ${password}
    Set Text [Arguments] id:password ${password} ${SMALL_RETRY_COUNT}

Cliquer Sur Bouton Connexion
    Click Element    xpath://button[@type='submit']    ${SMALL_RETRY_COUNT}

Cliquer Sur Image Profil
    Click Element    xpath://img[contains(@class,'profile') or contains(@alt,'profile')]    ${SMALL_RETRY_COUNT}

Cliquer Sur Signaler Bugs
    Click Element    xpath://a[contains(.,'Signaler bugs') or contains(.,'Signaler un bug')]    ${SMALL_RETRY_COUNT}

Remplir Champ Titre Bug
    [Arguments]    ${titre}
    Set Text [Arguments] xpath://*[@id="address__form__input"] ${titre} ${SMALL_RETRY_COUNT}

Remplir Champ Description Bug
    [Arguments]    ${description}
    Set Text [Arguments] xpath://*[@id="exp__form__input"] ${description} ${SMALL_RETRY_COUNT}

Uploader Fichier Justificatif
    [Arguments]    ${chemin_fichier}
    Choose File    xpath://input[@type='file']    ${chemin_fichier}

Cliquer Sur Bouton Soumettre Bug
    Click Element
    ...    xpath://button[contains(.,'Envoyer') or contains(.,'Soumettre') or @type='submit']
    ...    ${SMALL_RETRY_COUNT}

Verifier Message D'Erreur Titre Obligatoire
    Page Should Contain    titre est obligatoire

Verifier Message D'Erreur Upload Limite
    Page Should Contain    Maximum 4 fichiers
