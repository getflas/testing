*** Settings ***
Library           Middleware.py

*** Variables ***

*** Test Cases ***
verify_login
    
    ${login_response}    Login
    Run Keyword If    ${login_response}==200    Log    User Logged In Successfully
    ${Role_response}    Create Role
    Run Keyword If    ${Role_response}==200    Log    Role Created Successfully
    ${User_response}    Create User
    Run Keyword If    ${User_response}==200    Log    User Created Successfully
    ${user_del_response}    Delete User
    Run Keyword If    ${user_del_response}==200    Log    User Deleted Successfully
    ${role_del_response}    Delete Role
    Run Keyword If    ${role_del_response}==200    Log    Role Deleted Successfully
    
