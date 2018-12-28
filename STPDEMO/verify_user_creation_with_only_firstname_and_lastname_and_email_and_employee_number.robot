*** Settings ***

*** Variables ***

*** Test Cases ***
verify_login
    ${x}    Set Variable    10
    ${y}    Set Variable    20
    Run Keyword If    ${y} == ${x}
    ...    Log    both are equal    level=INFO
    ...    ELSE    Log    both are not equal    level=INFO
