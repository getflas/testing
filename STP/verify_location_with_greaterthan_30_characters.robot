*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library
&{stp_server}     os=ubuntu    version=14.04    ip=
@{softwares}      python-pip

*** Test Cases ***
verify_location_with_greaterthan_30_characters
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
    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    Wait Until Element Is Visible    xpath://*[@id="firstname"]    30
    Input Text    xpath://*[@id="firstname"]    test
    Wait Until Element Is Visible    id:lastname    30
    Input Text    id:lastname    test
    Wait Until Element Is Visible    id:email    30
    Input Text    id:email    abcdef@gm.com
    Wait Until Element Is Visible    id:empno    30
    Input Text    id:empno    456675
    Wait Until Element Is Visible    id:roleId    30
    Click Element    id:roleId
    Wait Until Element Is Visible    xpath://*[@id="roleId"]/option[10]    30
    Click Element    xpath://*[@id="roleId"]/option[10]
    Wait Until Element Is Visible    id:reportingId    30
    Click Element    id:reportingId
    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[12]    30
    Click Element    xpath://*[@id="reportingId"]/option[12]
    Wait Until Element Is Visible    id:location    30
    Input Text    id:location    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    Wait Until Page Contains Element    id:createuser    30
    Click Element    id:createuser
    Wait Until Page Contains    User's location has to be less than 30 charecters    50
    Close Browser
