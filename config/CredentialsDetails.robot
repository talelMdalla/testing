*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# CREATE MISSION
${LOCAL_EMAIL_CREATE_MISSION}       vajayeb494@kaoing.com
${DEV_EMAIL_CREATE_MISSION}         vajayeb494@kaoing.com
${PROD_EMAIL_CREATE_MISSION}        vajayeb494@kaoing.com

${LOCAL_PASS_CREATE_MISSION}        123Ghada!
${DEV_PASS_CREATE_MISSION}          123Ghada!
${PROD_PASS_CREATE_MISSION}         123Ghada!

${TEST_EMAIL_CREATE_MISSION}        ${${ENV}_EMAIL_CREATE_MISSION}
${TEST_PASS_CREATE_MISSION}         ${${ENV}_PASS_CREATE_MISSION}

# AUTH

${LOCAL_EMAIL_AUTH}                 testing1.daxme@gmail.com
${DEV_EMAIL_AUTH}                   testing1.daxme@gmail.com
${PROD_EMAIL_AUTH}                  testing.daxme@gmail.com

${LOCAL_PASS_AUTH}                  Boutcho123&
${DEV_PASS_AUTH}                    Boutcho123&
${PROD_PASS_AUTH}                   Daxme2021&

${TEST_EMAIL_AUTH}                  ${${ENV}_EMAIL_AUTH}
${TEST_PASS_AUTH}                   ${${ENV}_PASS_AUTH}

# CREATE COMPANY AND JOIN COMPANY

${LOCAL_EMAIL_COMPANY}              tokise2154@bezill.com
${DEV_EMAIL_COMPANY}                tokise2154@bezill.com
${PROD_EMAIL_COMPANY}               tokise2154@bezill.com

${LOCAL_PASS_COMPANY}               123Ghada!
${DEV_PASS_COMPANY}                 123Ghada!
${PROD_PASS_COMPANY}                123Ghada!

${TEST_EMAIL_COMPANY}               ${${ENV}_EMAIL_COMPANY}
${TEST_PASS_COMPANY}                ${${ENV}_PASS_COMPANY}

# SIRET

${LOCAL_SIRET}                      55203253400646
${DEV_SIRET}                        55203253400646
${PROD_SIRET}                       00000000000000

${TEST_SIRET}                       ${${ENV}_SIRET}

# CRITICAL CI ACCOUNTS
${LOCAL_EMAIL_CRITICAL_AGENT}      test_agent@yopmail.com
${DEV_EMAIL_CRITICAL_AGENT}        test_agent@yopmail.com
${PROD_EMAIL_CRITICAL_AGENT}       test_agent@yopmail.com
${LOCAL_PASS_CRITICAL_AGENT}       Daxme2021&
${DEV_PASS_CRITICAL_AGENT}         Daxme2021&
${PROD_PASS_CRITICAL_AGENT}        Daxme2021&
${TEST_EMAIL_CRITICAL_AGENT}       ${${ENV}_EMAIL_CRITICAL_AGENT}
${TEST_PASS_CRITICAL_AGENT}        ${${ENV}_PASS_CRITICAL_AGENT}

${LOCAL_EMAIL_CRITICAL_CLIENT}     test_client@yopmail.com
${DEV_EMAIL_CRITICAL_CLIENT}       test_client@yopmail.com
${PROD_EMAIL_CRITICAL_CLIENT}      test_client@yopmail.com
${LOCAL_PASS_CRITICAL_CLIENT}      Daxme2021&
${DEV_PASS_CRITICAL_CLIENT}        Daxme2021&
${PROD_PASS_CRITICAL_CLIENT}       Daxme2021&
${TEST_EMAIL_CRITICAL_CLIENT}      ${${ENV}_EMAIL_CRITICAL_CLIENT}
${TEST_PASS_CRITICAL_CLIENT}       ${${ENV}_PASS_CRITICAL_CLIENT}

${LOCAL_EMAIL_CRITICAL_COMPANY}    neilafakherr@gmail.com
${DEV_EMAIL_CRITICAL_COMPANY}      neilafakherr@gmail.com
${PROD_EMAIL_CRITICAL_COMPANY}     neilafakherr@gmail.com
${LOCAL_PASS_CRITICAL_COMPANY}     Fakher@3000
${DEV_PASS_CRITICAL_COMPANY}       Fakher@3000
${PROD_PASS_CRITICAL_COMPANY}      Fakher@3000
${TEST_EMAIL_CRITICAL_COMPANY}     ${${ENV}_EMAIL_CRITICAL_COMPANY}
${TEST_PASS_CRITICAL_COMPANY}       ${${ENV}_PASS_CRITICAL_COMPANY}
