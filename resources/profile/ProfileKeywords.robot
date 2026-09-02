*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Acces to profile page
    Click Button    xpath://*[@data-test-id="photo_profile"]
    Click Element    xpath://*[@data-test-id="profile"]
