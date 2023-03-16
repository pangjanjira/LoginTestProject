*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Resource  ../Resources/CommonFunctional.robot

Test Setup  Strat TestCase
Test Teardown  Finish TestCase

*** Variables ***

*** Test Cases ***
Case 1 : Login Successfull
    [documentation]  To verify that users can login successfully when put a correct username and password.
    [tags]  Functional

    Input Text  id:username  tomsmith
    Input Text  id:password  SuperSecretPassword!
    Press Keys  xpath://*[@id="login"]/button/i  [return]
    Wait Until Page Contains  You logged into a secure area!
    Press Keys  xpath://*[@id="content"]/div/a/i  [return]
    Wait Until Page Contains  You logged out of the secure area!

Case 2 : Login failed - Password incorrect
    [documentation]  To verify that users can login unsuccessfully when they put a correct username but wrong password.
    [tags]  Functional

    Input Text  id:username  tomsmith
    Input Text  id:password  Password!
    Press Keys  xpath://*[@id="login"]/button/i  [return]
    Wait Until Page Contains  Your password is invalid!

Case 3 : Login failed - Username not found
    [documentation]  To verify that users can login unsuccessfully when they put a username that did not exist.
    [tags]  Functional

    Input Text  id:username  tomholland
    Input Text  id:password  Password!
    Press Keys  xpath://*[@id="login"]/button/i  [return]
    Wait Until Page Contains  Your username is invalid!

*** Keywords ***

