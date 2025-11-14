*** Settings ***
Resource ../resources/keywords.robot
Variables ../variables.robot


*** Test Cases ***
Get product list
Create Session To API
${resp}= Get Request api /products
Status Should Be ${resp} 200
${body}= To Json ${resp.content}
Length Should Be ${body} >=1


Create new product (admin)
[Tags] smoke
Create Session To API
${payload}= Create Dictionary name=Test Product price=49.99 sku=TP-100
${headers}= Create Dictionary Authorization=Bearer ${AUTH_TOKEN}
${resp}= Post Request api /products json=${payload} headers=${headers}
Status Should Be ${resp} 201
${id}= Get Json Field ${resp} id
Should Not Be Empty ${id}