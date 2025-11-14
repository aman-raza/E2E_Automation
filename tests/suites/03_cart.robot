*** Settings ***
Resource ../resources/keywords.robot
Variables ../variables.robot


*** Test Cases ***
Add product to cart
Create Session To API
${headers}= Create Dictionary Authorization=Bearer ${AUTH_TOKEN}
${payload}= Create Dictionary product_id=1 quantity=2
${resp}= Post Request api /cart json=${payload} headers=${headers}
Status Should Be ${resp} 200
${total}= Get Json Field ${resp} total
Should Be True ${total} >= 0