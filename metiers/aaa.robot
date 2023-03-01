*** Settings ***
Library           SeleniumLibrary
Resource    ../application/template/data_template.robot

*** Variables ***
${browser}        chrome
${url}    http://www.ausy.fr/
${time}    2
@{search}    boulanger    pain    brioche    bonbon    Connexion

${locator.lapin}    bunny

${avatar_profession}    prof

*** Keywords ***
Manipuler liste

    ${liste}    BuiltIn.Create List     item1    item2     item3     item4  item5    item6

    FOR    ${cell}    IN        @{search}
        Log    ${cell}
    END





itialisation du navigateur
    ${url}=                 Set Variable    ${feuille_JDD_${SQUAD}}
    ${chromeOptions}=       Evaluate        sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =              Create Dictionary   download.default_directory=${DOWNLOAD_DIR}
    ...                                 download.prompt_for_download=false
    Call Method     ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method     ${chromeOptions}    add_argument    --headless
    Call Method     ${chromeOptions}    add_argument    --disable-gpu
    # Call Method     ${chromeOptions}    add_argument    --lang\=fr-FR
    SeleniumLibrary.Open Browser        url=${url}
    ...                                 browser=chrome
    ...                                 options=${chromeOptions}
    Maximize Browser Window



keyword variabilise
    # Je "lapin" des tomates
    Page aaa | Saisir dans code postal
    Page aaa | Saisir dans ville
    Page aaa | Saisir dans Angers
    Page aaa | Saisir dans Angers
    Page aaa | Saisir dans Paris
    Page aaa | Saisir dans Paris
    Page aaa | Saisir dans Paris
    Page aaa | Saisir dans Angers


zzzz
    keyword variabilise
    Choisir "profession" dans ecoles

Choisir dans ${loc.avatar_simulation}

Je mange des ${objet}
    Log To Console    OK 

Choisir "${element}" dans ${objet}
    Log To Console    Afficher : ${element}
    Log To Console    Afficher : ${avatar_${element}}

    Log To Console    ${objet}

Page aaa | Saisir ${element_de_la_page}
    Log To Console    variable : ${element_de_la_page}

*** Test Cases ***
# Google Index
#     Manipuler liste
keyword
    zzzz
