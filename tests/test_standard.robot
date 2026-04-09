*** Settings  ***
Test Teardown   run keyword if test passed  log to console  Bravo! Test réussi.        
Library    Dialogs
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
