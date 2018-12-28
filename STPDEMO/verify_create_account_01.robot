*** Settings ***
Library           Selenium2Library

*** Variables ***
@{packages}       robotframework-selenium2library
&{stp_server}     os=ubuntu    version=14.04    ip=
@{softwares}      python-pip

*** Test Cases ***
verify_create_account_01
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://${stp_server.ip}    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    id=emailid    50
    Input Text    id=emailid    sal1@gm.com
    Wait Until Page Contains Element    id:pwd    50
    Input Text    id:pwd    mypassword
    Wait Until Page Contains Element    xpath://text()[.='Log In']/ancestor::button[1]    50
    Click Element    xpath://text()[.='Log In']/ancestor::button[1]
    sleep    5
    Wait Until Page Contains Element    xpath://text()[.='Create Account']/ancestor::a[1]    50
    Click Element    xpath://text()[.='Create Account']/ancestor::a[1]
    sleep    5
    Wait Until Page Contains Element    xpath://*[@id="basic-form-add-res"]/div[3]/ul/li[2]/a    50
    Click Element    xpath://*[@id="basic-form-add-res"]/div[3]/ul/li[2]/a
    Wait Until Page Contains    Account Name should not be empty.    50
    Close Browser
