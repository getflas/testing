*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library
&{stp_server}     os=ubuntu    version=14.04    ip=
@{softwares}      python-pip

*** Test Cases ***
verify_login_page_with_valid_data
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://${stp_server.ip}    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    xpath=//input[@id='emailid']    50
    Wait Until Page Contains Element    xpath=//input[@id='pwd']    50
    Wait Until Page Contains Element    xpath=//button[@class='btn btn-purple btn-block text-uppercase waves-effect waves-light']    50
    Maximize Browser Window
    Wait Until Page Contains    Remember me    50
    Wait Until Page Contains    Forgot your password    50
    Close Browser
