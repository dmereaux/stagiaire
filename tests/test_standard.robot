*** Settings  ***
Test Teardown   run keyword if test passed  log to console  Bravo! Test réussi.        
Library    Dialogs
Library    Screenshot    screenshot_module=wxPython    screenshot_directory=${CURDIR}/screenshots
Library  String
Library  OperatingSystem
Suite Setup  Create Directory    ${CURDIR}/screenshots
*** Variables  ***
*** Test Cases  ***
Concatenation de deux chaînes de caractères
    [Documentation]    Teste la concaténation de deux chaînes de caractères.
    ${result}    Catenate    Hello     World
    Should Be Equal   ${result}    HelloWorld
etape manuelle et recuperation de valeurs
    Execute Manual Step    vérifier led1 allumé   la led est pas allumée
    @{selections}     Get Selections From User    titre   sel1    sel2    sel3
    FOR    ${selection}    IN    @{selections}
        Log To Console    Ma sélection: ${selection}
    END
    Take Screenshot    photo
Decomposer une phrase en mots et boucler sur la liste des mots
    [Documentation]    Teste la décomposition d'une phrase en mots.
    ${phrase}  set variable   This is a test
    @{mots}    Split String    ${phrase}
    FOR    ${mot}    IN    @{mots}
        Log To Console    Mot: ${mot}
    END
Decomposer une adresse email en nom d'utilisateur et domaine
    [Documentation]    Teste la décomposition d'une adresse email.
    ${email}   set variable   user@example.com
    @{parts}    Split String    ${email}    @
    Should be equal    ${parts}[0]    user
    Should be equal   ${parts}[1]    example.com