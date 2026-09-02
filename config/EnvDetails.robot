*** Variables ***
${ENV}              LOCAL
${LOCAL_ENV_URL}    https://dev.daxme.fr/app/login
${DEV_ENV_URL}      https://dev.daxme.fr/app/login
${PROD_ENV_URL}     https://www.daxme.fr/app/login
${TEST_ENV_URL}     ${${ENV}_ENV_URL}