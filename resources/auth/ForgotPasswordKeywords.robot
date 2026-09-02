*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Common.robot
Resource    ../../config/CredentialsDetails.robot

*** Variables ***
${VALID_EMAIL}              ${TEST_EMAIL_AUTH}
${INVALID_EMAIL}            testing
${EmailNotExist}            azure@gmail.com
${EMAIL_INVALID}            hamza.com
${Success_message}          e-mail de réinitialisation du mot de passe envoyé
${EmailNotEsixtError}       email n'existe pas
${InvalidEmailError}        S'il vous plaît entrez un email valide
${EmptyEmailError}          Ce champ est obligatoire

*** Keywords ***
Button LoginForm
    # FIXED: Use the correct button locator (it's a button, not a link)
    Common.Click Element    xpath://button[contains(text(), "Connexion")]    ${SMALL_RETRY_COUNT}

Forgot password button
    # This locator works - id="forgotPassword" from the HTML
    Common.Click Element    xpath://*[@id="forgotPassword"]    ${SMALL_RETRY_COUNT}

Input Email
    [Arguments]    ${email}
    # FIXED: Use Common.Set Text for stability
    Common.Set Text    id:Email    ${email}    ${SMALL_RETRY_COUNT}

Submit
    Common.Click Element    xpath://*[@data-test-id="btn_verification_email"]    ${SMALL_RETRY_COUNT}

Empty email error
    # FIXED: Use Element Text Should Contain instead of Element Text Should Be
    Element Text Should Contain    xpath://*[@data-test-id="reset-password-email"]    ${EmptyEmailError}    ${SMALL_RETRY_COUNT}

Invalid email error
    Element Text Should Contain    xpath://*[@data-test-id="reset-password-email"]    ${InvalidEmailError}    ${SMALL_RETRY_COUNT}

Email not exist error
    Element Text Should Contain    xpath://*[@data-test-id="reset-password-email"]    ${EmailNotEsixtError}    ${SMALL_RETRY_COUNT}

Success message
    Element Text Should Contain    xpath://*[@data-test-id="sucess_send_reset"]    ${Success_message}    ${SMALL_RETRY_COUNT}