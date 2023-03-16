*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Case 1 : Login Successfull
    [documentation]  To verify that users can login successfully when put a correct username and password.
    [tags]  Functional

    Open Browser  about:blank  chrome
    Go To  http://the-internet.herokuapp.com/login
    Maximize Browser Window

    Input Text  id:username  tomsmith
    Input Text  id:password  SuperSecretPassword!
    Press Keys  xpath://*[@id="login"]/button/i  [return]
    Page Should Contain  You logged into a secure area!
    Press Keys  xpath://*[@id="content"]/div/a/i  [return]
    Page Should Contain  You logged out of the secure area!
    Close Browser

Case 2 : Login failed - Password incorrect
    [documentation]  To verify that users can login unsuccessfully when they put a correct username but wrong password.
    [tags]  Functional

    Open Browser  about:blank  chrome
    Go To  http://the-internet.herokuapp.com/login
    Maximize Browser Window

    Input Text  id:username  tomsmith
    Input Text  id:password  Password!
    Press Keys  xpath://*[@id="login"]/button/i  [return]
    Page Should Contain  Your password is invalid!
    Close Browser

Case 3 : Login failed - Username not found
    [documentation]  To verify that users can login unsuccessfully when they put a username that did not exist.
    [tags]  Functional

    Open Browser  about:blank  chrome
    Go To  http://the-internet.herokuapp.com/login
    Maximize Browser Window

    Input Text  id:username  tomholland
    Input Text  id:password  Password!
    Press Keys  xpath://*[@id="login"]/button/i  [return]
    Page Should Contain  Your username is invalid!
    Close Browser

*** Keywords ***