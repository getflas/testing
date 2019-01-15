*** Settings ***
Library           Multiplication.py    WITH NAME    m
Library           Division.py    WITH NAME    d
    
*** Variables ***

*** Test Cases ***
verify_delete_user
    ${a}    d.Div
    Log    ${a}    level=INFO
    ${a}    Set Variable    200
    ${d}    Set Variable    z
    @{li}    Create List    ${a}    "asdf"
    ${a}    m.Mul
