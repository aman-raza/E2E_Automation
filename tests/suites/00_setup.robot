*** Settings ***
Resource ../resources/keywords.robot
Variables ../variables.robot


*** Test Cases ***
Ensure API Up
Create Session To API
${resp}= Get Request api /health
Status Should Be ${resp} 200