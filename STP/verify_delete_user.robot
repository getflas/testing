*** Settings ***

*** Variables ***

*** Test Cases ***
verify_delete_user
    Log    Print Odd Numbers Within a Given Range    level=INFO
    ${range}    Set Variable    12
    : For    ${num}    IN RANGE    1    ${range}
    \    ${quo}    Evaluate    int(${num})/2
    \    ${duo}    Evaluate    int(${quo})*2
    \    ${rem}    Evaluate    int(${duo})-int(${num})
    \    Run Keyword If    ${rem} != 0
    ...    Log    ${num}    level=INFO
