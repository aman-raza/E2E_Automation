*** Settings ***
Library RequestsLibrary
Library Collections
Library JSONLibrary


*** Keywords ***
Create Session To API
[Arguments] ${session_name}=api
Create Session ${session_name} ${BASE_URL}


POST Should Return Status
[Arguments] ${session} ${endpoint} ${payload} ${status}=200
${resp}= Post Request ${session} ${endpoint} json=${payload}
Status Should Be ${resp} ${status}
[Return] ${resp}


Status Should Be
[Arguments] ${resp} ${status}
Should Be Equal As Integers ${resp.status_code} ${status}


Get Json Field
[Arguments] ${resp} ${path}
${body}= To Json ${resp.content}
${val}= Get From Json ${body} ${path}
[Return] ${val}