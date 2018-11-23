*** Settings ***

*** Variables ***

*** Test Cases ***
verify_login
    
    ${name}    Set Variable    ankur
    @{cars}    Create List    bmw    name
    Run Keyword If    2 >= 1
    ...    Log    2 > 1    level=INFO
