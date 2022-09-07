*** Settings ***
Resource    %{WORKSPACE}/metiers/variables_library_global.resource

*** Keywords ***
Listing des scenarios en lignes a realiser
    BuiltIn.Wait Until Keyword Succeeds     3x      1 sec       jdd.Recuperation Du Google Sheet
    ExcelLibrary.Open Excel Document    ${EXCEL_FILE_CHEMIN}   NONE
    ${suiteFile}                        OperatingSystem.Get File    ${ROBOT_DEPLOY_CHEMIN}
    ${nb_testcases_total}=              set variable  0
    ${numero_cas_de_test_en_cours}=     set variable  0
    log to console   squad :  ::::  ${SQUAD}

    #FOR    ${excel_feuille_liste}    IN    @{list_sheet}
        ${ligne_variables}              ExcelLibrary.Read Excel Row   row_num=1    col_offset=0  max_num=0   sheet_name=${EXCEL_FEUILLE}
        ${nb_ligne_variables}           BuiltIn.Get length    ${ligne_variables}
        ${ligne_variables_oui_non}      ExcelLibrary.Read Excel Row   row_num=2    col_offset=0  max_num=0   sheet_name=${EXCEL_FEUILLE}
        ${nb_ligne_variables_utile}     Evaluate    ${nb_ligne_variables} - ${COLONNE_INUTILE}
        Set Suite Variable  ${ligne_variables}
        Set Suite Variable  ${ligne_variables_oui_non}
        ${nb_testcases}             BuiltIn.Get Length          ${ligne_variables}
        ${nb_testcases_total}=      Evaluate    int(${nb_testcases}) + int(${nb_testcases_total} - 2)
        ${nb_ligne_variables}       BuiltIn.Get length          ${ligne_variables}
        FOR    ${index}    IN RANGE    ${COLONNE_INUTILE}     ${nb_testcases}
            ${choix_dico}    Evaluate    ${index} - ${COLONNE_INUTILE} + ${nb_testcases_total}
            IF  "${ligne_variables_oui_non}[${index}]" == "Oui"
                ${suiteFile} =  Catenate    SEPARATOR=\n\t    ${suiteFile}\n${ligne_variables[${index}]}     ${numero_cas_de_test_en_cours}\n
            END
            ${numero_cas_de_test_en_cours}  Evaluate    ${numero_cas_de_test_en_cours} + 1
        END
    #END
    OperatingSystem.Create File    testSuiteGenerated.robot    ${suiteFile}   UTF-8


*** Test Cases ***
Génération...
    Listing des scenarios en lignes a realiser
    ExcelLibrary.Close All Excel Documents


