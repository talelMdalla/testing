*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# Extecution Browser
${LANGUAGE_SETTINGS}        add_argument("--lang=fr");add_experimental_option("prefs", {"intl.accept_languages": "fr"});
${COMMON_OPTS}              ${LANGUAGE_SETTINGS}add_argument("--headless=new");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080");add_argument("--force-device-scale-factor=0.75");


${BROWSER}                  chrome
${LOCAL_BROWSER_OPTIONS}    ${LANGUAGE_SETTINGS}
${DEV_BROWSER_OPTIONS}      ${COMMON_OPTS}
${PROD_BROWSER_OPTIONS}     ${COMMON_OPTS}
${TEST_BROWSER_OPTIONS}     ${${ENV}_BROWSER_OPTIONS}
# ${TEST_BROWSER}    firefox
# ${TEST_BROWSER}    safari
