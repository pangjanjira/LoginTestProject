*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Strat TestCase
    Open Browser  about:blank  chrome
    Go To  http://the-internet.herokuapp.com/login
    Maximize Browser Window

Finish TestCase
    Close Browser