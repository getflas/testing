*** Settings ***
Library           Selenium2Library

*** Variables ***
@{packages}       robotframework-selenium2library
&{stp_server}     os=ubuntu    version=14.04    ip=
@{softwares}      python-pip

*** Test Cases ***
verify_firstname_greaterthan_25_characters
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
    Input Text    xpath://*[@id="firstname"]    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    Comment    Wait Until Element Is Visible    id:lastname    30
    Comment    Input Text    id:lastname    fifteen
    Comment    Wait Until Element Is Visible    id:email    30
    Comment    Input Text    id:email    35testing35@gm.com
    Comment    Wait Until Element Is Visible    id:empno    30
    Comment    Input Text    id:empno    3535
    Comment    Wait Until Element Is Visible    id:roleId    30
    Comment    Click Element    id:roleId
    Comment    Wait Until Element Is Visible    xpath://*[@id="roleId"]/option[10]    30
    Comment    Click Element    xpath://*[@id="roleId"]/option[10]
    Comment    Wait Until Element Is Visible    id:reportingId    30
    Comment    Click Element    id:reportingId
    Comment    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[12]    30
    Comment    Click Element    xpath://*[@id="reportingId"]/option[12]
    Comment    Wait Until Element Is Visible    id:location    30
    Comment    Input Text    id:location    hyderabad
    Wait Until Page Contains Element    id:createuser    30
    Click Element    id:createuser
    Wait Until Page Contains    Firstname is too long.Maximum length is 25 characters    50
    Close Browser
