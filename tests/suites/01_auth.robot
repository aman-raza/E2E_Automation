*** Settings ***
Resource ../resources/keywords.robot
Variables ../variables.robot


*** Test Cases ***
Login with valid credentials
Create Session To API
${payload}= Create Dictionary email=${ADMIN_USER} password=${ADMIN_PASS}
${resp}= POST Should Return Status api /auth/login ${payload} 200
${token}= Get Json Field ${resp} token
Should Not Be Empty ${token}
# store token in suite variable for later tests
Set Suite Variable ${AUTH_TOKEN} ${token}