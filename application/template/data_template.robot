*** Settings ***
Resource    %{WORKSPACE}/metiers/variables_library_global.resource

Suite Setup         Initialisation des Tests Cases
Test Template       Debut du test case
Test Teardown       Fermeture Navigateur


*** Keywords ***
Initialisation des Tests Cases
    SeleniumLibrary.Set Selenium Timeout    ${GLOBAL_TIMEOUT}
    jdd.Creer dictionnaire global variables

Debut du test case
    [Arguments]     ${choix_dico}
    jdd.Creer les variables du test    ${choix_dico}
    commun.Initialisation Des Variables Du Test
    #commun.verifier compte non bloque
    test_auto.Connexion au site de Google




Fermeture Navigateur
    BuiltIn.Run Keyword If Test Passed      SeleniumLibrary.Close All Browsers

*** Test Cases ***
