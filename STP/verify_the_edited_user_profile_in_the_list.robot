*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library
&{stp_server}     os=ubuntu    version=14.04    ip=
@{softwares}      python-pip

*** Test Cases ***
verify_the_edited_user_profile_in_the_list
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://${stp_server.ip}    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    xpath=//input[@id='emailid']    50
    Input Text    xpath=//input[@id='emailid']    veera@gm.com
    Wait Until Page Contains Element    xpath=//input[@id='pwd']    50
    Input Password    xpath=//input[@id='pwd']    mypassword
    Click Button    xpath=//button[@class='btn btn-purple btn-block text-uppercase waves-effect waves-light']
    Maximize Browser Window
    Sleep    5
    Wait Until Page Contains Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a    30
    Wait Until Page Contains Element    xpath://*[@id="userstable"]/tr[1]/td[8]/a[1]/i    50
    Click Element    xpath://*[@id="userstable"]/tr[1]/td[8]/a[1]/i
    Wait Until Page Contains Element    xpath://*[@id="email1"]    50
    Wait Until Page Contains Element    xpath://*[@id="empno1"]    50
    Close Browser
