*** Settings ***
Library         Collections
Library         ExcelLibrary
Library         OperatingSystem
Library         String
# Library         DebugLibrary
Library         SeleniumLibrary     #screenshot_root_directory=%{ROBOT_DEPLOY}\\robots\\Template\\metiers\\screenshots\\
Library         BuiltIn
# Library         RequestsLibrary
Library         Process
Library         DateTime
Library         XML
# Library         yaml
Resource        %{WORKSPACE}/metiers/jdd.resource
#Les resources des pages :
Resource        %{WORKSPACE}/application/commun.resource
#Parcours :
Resource        %{WORKSPACE}/application/parcours/test_auto.resource

*** Variables ***
${EXCEL_FILE_CHEMIN}            %{WORKSPACE}/JDD.xlsx
${COLONNE_INUTILE}              2
${ROBOT_DEPLOY_CHEMIN}          %{WORKSPACE}/application/template/data_template.robot
# Squad dispo : marvel	partenaire	back_vente
${SQUAD}                        marvel
# feuille dispo : amaris  espace_partenaire  contact  back_office
${EXCEL_FEUILLE}                feuille_jdd
${GLOBAL_TIMEOUT}               30 seconds
${FEUILLE_JDD}                  https://docs.google.com/spreadsheets/d/1mXyGXZFjch9ZQu-gyA7e51Fxy3Qe304Ye7uoz7RXoh8/edit#gid=0
${EMAIL_GMAIL}                  ndfndf78@gmail.com
${DOWNLOAD_DIR}                 %{WORKSPACE}
${NAVIGATEUR}                   chrome
