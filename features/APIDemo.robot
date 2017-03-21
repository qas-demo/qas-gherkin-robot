***Settings***
Resource            ../configs/allConfigs.robot

Library             ExtendedRequestsLibrary
Library             HttpLibrary.HTTP

***Variables***

***Test Cases***
Test Postman 200 Response
    Create Session      Postman     ${API HOST}
    ${resp}=        Get Request         Postman     /status/200
    Log Many        ${resp}

Do a Get Request
    Create Session      Postman     ${API HOST}
    &{params}       Create Dictionary       test=123
    ${resp}=        Get Request         label=Postman     uri=/get      params=&{params}
    Log Many        ${resp.text}
    ${header}=      Get Json value      ${resp.text}     /headers/user-agent
    Log To Console  ${header}
    Log             ${header}
