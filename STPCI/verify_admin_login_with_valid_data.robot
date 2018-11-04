*** Settings ***
Library           Selenium2Library
Library           Collections
Library           middleware.py    WITH NAME    stp

*** Variables ***
@{packages}       robotframework-selenium2library
&{stp_chargeitem_server}     os=ubuntu    version=14.04    ip=
@{softwares}      python-pip

*** Test Cases ***
verify_admin_login_with_valid_data
    Log    Login functionality in \ project
    ${login_resp}    Login
    log    ${login_resp}
    ${status_ok}    Set Variable    200
    log    ${login_resp['status']}
    Should Be Equal As Integers    ${status_ok}    ${login_resp['status']}    msg=${login_resp['project_name']} Login\ Post method API failed.Expected response code is ${STATUS_OK} but returned is ${login_resp['status']}    values=false
