*** Keywords ***
Attente chargement de element
    [Arguments]     ${locator}
    ...             ${valeur_possible_element}=${EMPTY}
    ...             ${timeout}=${GLOBAL_TIMEOUT}

    ${message_d_erreur}=                                BuiltIn.catenate
    ...                                                 *HTML*Il semble y avoir un problème avec l'élément recherché sur la page  : ${locator}, avec la valeur : \"${valeur_possible_element}\"<br>
    ...                                                 Il peut y avoir plusieurs solutions :<br>
    ...                                                 \t1- Soit le champ est renseigné dans le google sheet alors qu'il ne doit pas l'être => Vider le champ<br>
    ...                                                 \t2- Soit le champ n'est pas visible sur la page => Voir le screenshot<br>
    Run Keyword And Ignore Error                        SeleniumLibrary.Wait Until Page Contains Element
    ...                                                 locator=${locator}
    ...                                                 timeout=${timeout}
    ...                                                 error=${message_d_erreur}
    # SeleniumLibrary.Page Should Contain Element         locator=${locator}
    # ...                                                 message=${message_d_erreur}
    SeleniumLibrary.Wait Until Element Is Enabled       locator=${locator}
    ...                                                 timeout=${timeout}
    ...                                                 error=${message_d_erreur}
    commun.Faire Defiler Page                           direction=${locator}
    SeleniumLibrary.Wait Until Element Is Visible       locator=${locator}
    ...                                                 error=${message_d_erreur}
    ...                                                 timeout=${timeout}

Cliquer sur element
    [Arguments]     ${locator}
    Attente chargement de element                           locator=${locator}
    ${nbElement}=                                           SeleniumLibrary.Get Element Count
    ...                                                     locator=${locator}
    BuiltIn.Should Be True                                  condition=${nbElement} == 1
    ...                                                     msg=Attention le robot ne sait pas où il doit cliquer. Il y a ${nbElement} de trouvé pour le locator : ${locator}
    #Ici il faudrait tester le runkeyword and succeeds
    BuiltIn.Wait Until Keyword Succeeds  3x  0.2 sec        SeleniumLibrary.Click Element
    ...                                                     locator=${locator}
    commun.Attendre Que La Page Soit Prete
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//div[contains(@class,"progress")]
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader.
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//*[@class='uil-default-css']
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader sur Avatar.
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//*[@id='loader']
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader sur Avatar.

Cocher sur element
    [Arguments]     ${locator}
    Attente chargement de element                           locator=${locator}
    ${nbElement}=                                           SeleniumLibrary.Get Element Count
    ...                                                     locator=${locator}
    BuiltIn.Should Be True                                  condition=${nbElement} == 1
    ...                                                     msg=Attention le robot ne sait pas où il doit cliquer. Il y a ${nbElement} de trouvé pour le locator : ${locator}
    #Ici il faudrait tester le runkeyword and succeeds
    BuiltIn.Wait Until Keyword Succeeds  3x  0.2 sec        SeleniumLibrary.Select Checkbox
    ...                                                     locator=${locator}
    commun.Attendre Que La Page Soit Prete
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//div[contains(@class,"progress")]
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader.
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//*[@class='uil-default-css']
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader sur Avatar.
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//*[@id='loader']
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader sur Avatar.

Decocher sur element
    [Arguments]     ${locator}
    Attente chargement de element                           locator=${locator}
    ${nbElement}=                                           SeleniumLibrary.Get Element Count
    ...                                                     locator=${locator}
    BuiltIn.Should Be True                                  condition=${nbElement} == 1
    ...                                                     msg=Attention le robot ne sait pas où il doit cliquer. Il y a ${nbElement} de trouvé pour le locator : ${locator}
    #Ici il faudrait tester le runkeyword and succeeds
    BuiltIn.Wait Until Keyword Succeeds  3x  0.2 sec        SeleniumLibrary.Unselect Checkbox
    ...                                                     locator=${locator}
    commun.Attendre Que La Page Soit Prete
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//div[contains(@class,"progress")]
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader.
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//*[@class='uil-default-css']
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader sur Avatar.
    SeleniumLibrary.Wait Until Element Is Not Visible       locator=//*[@id='loader']
    ...                                                     error=Il y a un problème dans l'attente de la disparition du loader sur Avatar.

Saisir sur element
    [Arguments]     ${locator}
    ...             ${texte_a_saisir}
    ...             ${timeout}=${GLOBAL_TIMEOUT}
    Attente chargement de element   locator=${locator}
    ...                             valeur_possible_element=${texte_a_saisir}
    ...                             timeout=${timeout}
    SeleniumLibrary.Input text      locator=${locator}
    ...                             text=${texte_a_saisir}

Faire Defiler Page
    [Arguments]    ${direction}
    #${element}=                                     SeleniumLibrary.Get WebElement
    #...                                             locator=${direction}
    #SeleniumLibrary.Execute Javascript        arguments[0].scrollIntoView({block: 'center'});    ARGUMENTS    ${element}
    ${height_bandeau}=                              set variable   100
    ${width_bandeau}=                               set variable   0
    IF  "${SQUAD}" != "back_vente"
        ${element_exist}=                               Run Keyword And Return Status
        ...                                             SeleniumLibrary.Page Should Contain Element
        ...                                             locator=//div[@id="component-sticky-header"]
        IF  "${element_exist}" == "True"
            ${width_bandeau}	${height_bandeau}=	    SeleniumLibrary.Get Element Size	locator=//div[@id="component-sticky-header"]
        END
    END
    ${width}	${height}=	                        SeleniumLibrary.Get Element Size	locator=${direction}
    ${coordonnee_vertical}=                         SeleniumLibrary.Get Vertical Position  locator=${direction}
    ${coordonne_vertical_sans_header}=              Evaluate     ${coordonnee_vertical}-${height}-${height_bandeau}-100
    SeleniumLibrary.Execute Javascript              window.scrollTo(0,${coordonne_vertical_sans_header})
    Sleep  0.1

Cliquer sur le bouton
    [Arguments]    ${nom_du_bouton}
    commun.Cliquer sur element      locator=//*[contains(text(),'${nom_du_bouton}')]

Cliquer sur le bouton Suivant
    commun.Cliquer sur element      locator=//*[contains(text(),'Suivant')]/..

Cliquer sur le bouton Valider
    commun.Cliquer sur element      locator=//*[@class='submit row justify-content-between ng-star-inserted']//*[contains(text(),'Valider')]

Selectionner dans menu deroulant par label
    [Arguments]     ${locator}   ${label}

    commun.Faire Defiler Page                       direction=${locator}
    SeleniumLibrary.Select From List By Label       locator=${locator}
    ...                                             labels=${label}

Attendre Que La Page Soit Prete
    ${isReady}=                             SeleniumLibrary.Execute Javascript
    ...                                     return document.readyState;
    BuiltIn.Should Be Equal As Strings      first=${isReady}
    ...                                     second=complete
    ...                                     msg=Il y a un problème avec le chargement de la page.

verifier compte non bloque
    ${resp}=  Process.Run Process    curl -X POST http://badtesttoolsapi-rec.domi-r.cloud.arkea.com:8080/badtesttoolsapi/api/v1/access/10/PRF/${numero_adherent}/reset-security -H "accept: text/plain"    shell=True
    Log to console  resp : ${resp}

Debloquer compte
    [Arguments]  ${compte_a_debloquer}

    OperatingSystem.Set Environment Variable    name=http_proxy
    ...                                         value=%USERNAME%:%PASSWORD%@pxy-user-intranet-ren-lb.mud.arkea.com:3128
    OperatingSystem.Set Environment Variable    name=https_proxy
    ...                                         value=%USERNAME%:%PASSWORD%@pxy-user-intranet-ren-lb.mud.arkea.com:3128
    ${resp}=                                    POST
    ...                                         url=http://badtesttoolsapi-rec.domi-r.cloud.arkea.com:8080/badtesttoolsapi/api/v1/access/10/PRF/${compte_a_debloquer}/reset-security
    RequestsLibrary.Status Should Be            expected_status=200

Verification Presence Message Erreur
    commun.Attente chargement de element        locator=//*[@id="error"]
    ${is_message_erreur}=                       SeleniumLibrary.Get Text
    ...                                         locator=//*[@id="error"]
    IF  "${is_message_erreur}" != "${EMPTY}"
        BuiltIn.Fail        msg=Amaris indique le message d'erreur suivant : "${is_message_erreur}"
    END

Initialisation Des Variables Du Test
    IF  "${SQUAD}" == "back_vente"   amaris_commun.Initialisation Des Variables Du Test Amaris

Uploader le fichier
    [Arguments]     ${locator}
    ...             ${file_path}

    OperatingSystem.File Should Exist   path=${file_path}
    ...                                 msg=Attention, le fichier ${file_path} ne semble pas exister !
    SeleniumLibrary.Choose File         locator=${locator}
    ...                                 file_path=${file_path}