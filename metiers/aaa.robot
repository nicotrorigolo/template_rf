*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${browser}        chrome
${url}    http://www.google.fr/
${time}    2
@{search}    boulanger    pain    brioche    bonbon    Connexion


*** Keywords ***
Manipuler liste

    ${liste}    BuiltIn.Create List     item1    item2     item3     item4  item5    item6

    FOR    ${cell}    IN        @{search}
        Log    ${cell}
    END

*** Test Cases ***
Google Index
    Manipuler liste

