***Settings***
Resource            ../configs/allConfigs.robot

Library             ExtendedRequestsLibrary
Library             HttpLibrary.HTTP

***Variables***

***Test Cases***
Call Postman Echo
     #[Description]   Get user-agent from postman
     Given A session with Postman Echo
     When Call the /get?test=123
     Then Get back /headers/user-agent equals python-requests/2.10.0


***Keywords***

A Session With Postman Echo
    Create Session      Postman     ${API HOST}

Call the /get?test=123
    &{params}       Create Dictionary       test=123
    ${resp}=        Get Request         label=Postman     uri=/get      params=&{params}
    Log Many        ${resp.text}
    ${header}=      Get Json value      ${resp.text}     /headers/user-agent
    Log To Console  ${header}
    Log             ${header}

Get back /headers/user-agent equals python-requests/2.10.0
    &{params}       Create Dictionary       test=123
    ${resp}=        Get Request         label=Postman     uri=/get      params=&{params}
    Log Many        ${resp.text}
    ${header}=      Get Json value      ${resp.text}     /headers/user-agent
    Log To Console  ${header}
    Log             ${header}