*** Settings ***

*** Variables ***

*** Test Cases ***
verify_login
    ${num1}    Set Variable    1
    ${num2}    Set Variable    2
    Run Keyword If    ${num2} >= ${num1}
    ...    Log    2 is greater than 1    level=INFO
    Log    comparision completed    level=INFO
    : For    ${i}    IN RANGE    0    num2
    \    Log    printing 2    level=INFO

    : For    ${i}    IN RANGE    0    num2
    \    Log    print 2 using loop    level=INFO

    Log    print 2 using loop    level=INFO
    Run Keyword If    ${num2} >= ${num1}
    ...    Run Keyword If    ${num1} <= ${num2}
    ...    Log    2 is greater than 1    level=INFO
    Log    comparision done    level=INFO
    : For    ${i}    IN RANGE    0    num2
    \    Run Keyword If    ${num2} >= ${num1}
    ...    Log    comparison in if and for    level=INFO

    Log    comparision done    level=ERROR
    &{person}    Create Dictionary    name=siva    weight=65
