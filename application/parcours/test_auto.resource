*** Settings ***
Resource    %{WORKSPACE}/metiers/variables_library_global.resource
# Library       chromeConfiguration.py
# Library       XvfbRobot



*** Keywords ***
Connexion au site de Google
    # ${chrome_options}    chromeConfiguration.Config
    # ${args}    chromeConfiguration.Serviceargs
    # Start Virtual Display    1920    1080
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    #Call Method    ${chrome_options}    add_argument    --window-size=1920,1080
    # Call Method    ${chrome_options}    add_argument    --log-level=ALL
    Open Browser    ${url}    ${browser}    options=${chrome_options}
    Set Window Size  1920  1080
    Maximize Browser Window    # Mettre la fenetre de chrome en plein ecran
    Capture Page Screenshot



