*** Settings ***
Library           Division    WITH NAME    d
Library           Multiplication    WITH NAME    m

*** Variables ***

*** Test Cases ***
verify_delete_user
    ${a}    Div
    Log    ${a}    level=INFO
    ${b}    Mul
    ${e}    Mul
    Set Global Variable    ${e}
