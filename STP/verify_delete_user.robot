*** Settings ***
Library           Addittion.py    WITH NAME    a

*** Variables ***

*** Test Cases ***
verify_delete_user
    Log    a    level=INFO
    ${s}    Set Variable    ${200}
    ${qa}    a.Div
    ${a}    a.Mul
    Set Global Variable    ${s}
