*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot
Resource    ../../config/EnvDetails.robot
Resource    ../../config/CredentialsDetails.robot

*** Variables ***
${APP_BASE_URL}    https://dev.daxme.fr
${CRITICAL_AGENT_EMAIL}    ${TEST_EMAIL_CRITICAL_AGENT}
${CRITICAL_AGENT_PASSWORD}    ${TEST_PASS_CRITICAL_AGENT}

*** Keywords ***
Open Domain Browser
    SeleniumLibrary.Open Browser    ${TEST_ENV_URL}    ${BROWSER}    options=${TEST_BROWSER_OPTIONS}
    SeleniumLibrary.Set Window Size    width=1920    height=1080
    SeleniumLibrary.Set Selenium Speed    ${TEST_SELENIUM_SPEED}
    SeleniumLibrary.Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    ${cookie_button_exists}=    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${cookies_btn}    timeout=3s
    Run Keyword If    ${cookie_button_exists}    SeleniumLibrary.Click Element    ${cookies_btn}

Login As Critical Agent
    Open Domain Browser
    Common.Set Text    id:email    ${CRITICAL_AGENT_EMAIL}    ${SMALL_RETRY_COUNT}
    Common.Set Text    xpath=//input[@type='password']    ${CRITICAL_AGENT_PASSWORD}    ${SMALL_RETRY_COUNT}
    Common.Click Element    xpath=//button[@data-test-id='button-login-loginModal' or normalize-space()='Connexion']    ${MEDIUM_RETRY_COUNT}
    Profile Avatar Should Be Visible    ${MEDIUM_RETRY_COUNT}

Open Domain Route
    [Arguments]    ${route}
    Go To    ${APP_BASE_URL}${route}
    Wait Until Page Does Not Contain Element    xpath=//*[contains(@class,'MuiCircularProgress') or contains(@class,'loading')]    timeout=30s

Page Should Be Authenticated
    Page Should Contain Element    xpath=//*[@data-test-id='photo_profile' or @data-test-id='profile']
