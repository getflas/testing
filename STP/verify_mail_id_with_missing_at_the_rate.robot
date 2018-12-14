*** Settings ***
Library           Middleware.py

*** Variables ***

*** Test Cases ***
verify_login
    ${login_res}    Login
    ${status_code}    Set Variable    200
    Run Keyword If    ${login_res} == ${status_code}
    ...    Log    login successfully    level=INFO
    ...    ELSE    Log    login failed    level=INFO
