*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/Common.robot


*** Keywords ***
Button LoginForm
    Common.Click Element    xpath://*[@data-test-id='button-login-loginModal']  ${SMALL_RETRY_COUNT}

Input Email
    [Arguments]    ${email}
    Common.Set Text    id:email    ${email}    ${SMALL_RETRY_COUNT}

Input password
    [Arguments]    ${password}
    Common.Set Text    xpath://input[@type='password']    ${password}    ${SMALL_RETRY_COUNT}

Submit Login
    Click Element    xpath://*[@data-test-id='button-login-loginModal']     ${SMALL_RETRY_COUNT}

Login with credentials
    [Documentation]    Logs in with valid credentials
    [Arguments]    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Browser Page
    Button LoginForm
    Input Email    ${VALID_EMAIL}
    Input password    ${VALID_PASSWORD}
    Submit Login
    Profile Avatar Should Be Visible

Profile button
    Common.Click Element [Arguments] xpath://*[@id="navBar"]/div[2]/div[2]/div[3]/div[5]/li/a/button/span[1] ${SMALL_RETRY_COUNT}

Click Element Safe
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=15s
    Scroll Element Into View         ${locator}
    Sleep    300ms
    Common.Click Element                   ${locator}

Trigger Blur
    Press Keys    xpath=//body    TAB