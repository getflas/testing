*** Settings ***

*** Variables ***

*** Test Cases ***
verify_login
    
    ${a}    Set Variable    10
    ${b}    Set Variable    20
    @{l1}    Create List    1    2    3    4
    &{dict}    Create Dictionary    d1=10    d2=11
    Run Keyword If    ${a} <= ${b}

    Run Keyword If    ${a} >= ${b}
    ...    Log    a <= b    level=INFO
