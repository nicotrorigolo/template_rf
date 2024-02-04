*** Settings ***
Library           BuiltIn

*** Variables ***
${browser}        chrome
${url}    http://www.ausy.fr/
${time}    2
@{search}    boulanger    pain    brioche    bonbon    Connexion

*** Keywords ***
Afficher log dans console
    BuiltIn.Log to console  Je suis un lapin

*** Test Cases ***
test1
    Afficher log dans console
