*** Settings ***
Library           Middleware.py
                  

*** Variables ***

*** Test Cases ***
verify_login
    
    ${login_response}    Login
    ${role_response}    Createrole
    ${user_response}    Createuser
    ${del_user_response}    Deleteuser
    ${del_role_response}    Deleterole
