*** Settings ***

*** Variables ***

*** Test Cases ***
verify_login
    ${a}    Set Variable    10
    Set Global Variable    ${a}
    @{list1}    Create List    1    2    3    4    ${a}
    &{dict1}    Create Dictionary    maths=50    hindi=60    englisg=70
    Run Keyword If    ${a} == 10
    ...    Log    both are equal    level=INFO
    ...    ELSE    Log    both are not equal    level=INFO
    Log    ${dict1}    level=INFO
    Log    ${list1}    level=INFO

