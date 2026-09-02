*** Settings ***
Resource    ../config/EnvDetails.robot
Resource    ../config/BrowserDetails.robot
Resource    ../config/SeleniumConfigs.robot
Library     SeleniumLibrary
Library     String
Library     OperatingSystem


*** Variables ***
${cookies_btn}      id:rcc-confirm-button


*** Keywords ***
Open Browser Page
    SeleniumLibrary.Open Browser    ${TEST_ENV_URL}    ${BROWSER}    options=${TEST_BROWSER_OPTIONS}
    SeleniumLibrary.Set Window Size    width=1920    height=1080
    # FIXED: Commented out - was breaking the page
    # SeleniumLibrary.Execute Javascript    window.localStorage.setItem('disable-recaptcha-daxme-test', 'true');
    SeleniumLibrary.Set Selenium Speed    ${TEST_SELENIUM_SPEED}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    BuiltIn.Set Log Level    DEBUG
    ${cookie_button_exists}=    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${cookies_btn}    timeout=3s
    Run Keyword If    ${cookie_button_exists}    SeleniumLibrary.Click Element    ${cookies_btn}
Logout From The Application
    [Documentation]
    ...    Logout from the application

    ${randomText}    String.Generate Random String    8    [LETTERS]
    RETURN    ${randomText}

Get Random Text
    [Documentation]
    ...    Return random text value

    ${randomText}    String.Generate Random String    8    [LETTERS]
    RETURN    ${randomText}

Get Current Epoch Time
    [Documentation]
    ...    Return current epoch time

    ${randomText}    SeleniumLibrary.Get Time    epoch
    RETURN    ${randomText}

Element Should Be Contained In The Page
    [Arguments]    ${locator}    ${retryScale}
    [Documentation]
    ...    Verify that the element should be contained in the page

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Page Contains Element    ${locator}

Element Should Not Be Contained In The Page
    [Arguments]    ${locator}    ${retryScale}
    [Documentation]
    ...    Verify that the element should not be contained in the page

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Page Does Not Contain Element    ${locator}

Element Should Be Visible
    [Arguments]    ${locator}    ${retryScale}
    [Documentation]
    ...    Verify that the element should be visible

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Visible    ${locator}

Element Should Not Be Visible
    [Arguments]    ${locator}    ${retryScale}
    [Documentation]
    ...    Verify that the element should not be visible

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Not Visible    ${locator}

Click Element
    [Arguments]    ${locator}    ${retryScale}=${SMALL_RETRY_COUNT}
    [Documentation]
    ...    Click on a given button (stable version with JS fallback)

    Wait Until Keyword Succeeds
    ...    ${retryScale}
    ...    ${RETRY_DELAY}
    ...    SeleniumLibrary.Wait Until Element Is Visible
    ...    ${locator}

    Scroll Element Into View    ${locator}
    Sleep    500ms

    ${status}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Click Element    ${locator}

    IF    not ${status}
        Log    "Fallback JS click used"
        ${xpath}=    String.Remove String    ${locator}    xpath=
        SeleniumLibrary.Execute JavaScript
        ...    document.evaluate("${xpath}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    END

Click Element By JavaScript Executor
    [Arguments]    ${elementXpathLocator}    ${retryScale}
    [Documentation]
    ...    Click an element by xpath using javascript executor

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Enabled    ${elementXpathLocator}
    ${elementXpathLocator}    String.Remove String    ${elementXpathLocator}    xpath=
    SeleniumLibrary.Execute JavaScript    document.evaluate("${elementXpathLocator}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

Element Text Should Be
    [Arguments]    ${locator}    ${text}    ${retryScale}
    [Documentation]
    ...    Validate the text of an element

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Element Text Should Be    ${locator}    ${text}

Scroll To Element
    [Arguments]    ${locator}    ${retryScale}
    [Documentation]
    ...    Scroll Into Element

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Scroll Element Into View    ${locator}

Element Text Should Contain
    [Arguments]    ${locator}    ${text}    ${retryScale}
    [Documentation]
    ...    Validate the text of an element

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Element Should Contain    ${locator}    ${text}

Set Text
    [Arguments]    ${textBoxLocator}    ${text}    ${retryScale}=${SMALL_RETRY_COUNT}
    [Documentation]
    ...    Input text into a text box

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Enabled    ${textBoxLocator}
    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Input Text    ${textBoxLocator}    ${text}

Scroll To The Top Of The Page
    [Documentation]
    ...    Scroll to the top of the page

    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 0)

Scroll To The Bottom Of The Page
    [Documentation]
    ...    Scroll to the bottom of the page

    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Check Page URL
    [Arguments]    ${expectedPageUrl}
    ${current_url}    SeleniumLibrary.Get Location
    BuiltIn.Should Contain    ${expectedPageUrl}    ${current_url}

Button Cookies
    [Arguments]    ${retryScale}=${SMALL_RETRY_COUNT}
    Click Element    ${cookies_btn}    ${retryScale}

Profile Avatar Should Be Visible
    [Arguments]    ${retryScale}=${SMALL_RETRY_COUNT}
    Element Should Be Visible    xpath://*[@data-test-id="photo_profile"]    ${retryScale}

Get Random Email
    [Documentation]    Return random email address
    ${randomText}    String.Generate Random String    8    [LETTERS]
    ${email}    BuiltIn.Set Variable    ${randomText}@example.com
    RETURN    ${email}

Get Random Phone Number
    [Documentation]    Return random phonenumber
    ${firstDigit}    BuiltIn.Set Variable    06
    ${randomText}    String.Generate Random String    8    [NUMBERS]
    ${phone}    BuiltIn.Set Variable    ${firstDigit}${randomText}
    RETURN    ${phone}

Select From List
    [Arguments]    ${locator}    ${text}    ${retryScale}
    [Documentation]
    ...    Select value from list

    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds   ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Select From List By Value    ${locator}    ${text}

Wait Until MUI Is Idle
    [Documentation]    Wait for MUI overlays/backdrops/snackbars to disappear
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'MuiBackdrop-root')]    timeout=10s
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'MuiSnackbar-root')]    timeout=10s
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'MuiDialog-root')]    timeout=10s
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'MuiPopover-root')]    timeout=10s