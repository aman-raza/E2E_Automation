*** Settings ***
Resource ../resources/keywords.robot
Variables ../variables.robot


*** Test Cases ***
Place an order
Create Session To API
${headers}= Create Dictionary Authorization=Bearer ${AUTH_TOKEN}
${payload}= Create Dictionary payment_method=card address=Test Address
${resp}= Post Request api /orders json=${payload} headers=${headers}
Status Should Be ${resp} 201
${order_id}= Get Json Field ${resp} id
Should Not Be Empty ${order_id}