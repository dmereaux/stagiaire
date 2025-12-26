*** Settings ***
Library    ../librairies/calculette.py
Test Setup    Log To Console    Début du test 
Test Teardown    Log To Console    Fin du test
Suite Setup    Log To Console    Début de la suite de tests
Suite Teardown    Log To Console    Fin de la suite de tests   

*** Variables ***
${PI}    3.14159
@{liste notes}    12    15    14    10    9
&{eleve}    nom=Dupont    prenom=Jean    
*** Test Cases ***
Addition de deux nombres
    ${result}=    addition    5    3
    Should Be Equal As Numbers   ${result}    8
Soustraction de deux nombres
    ${result}=    soustraction    10.2        4
    Should Be Equal As Numbers   ${result}    6.2
Moyenne de 2 nombres
    ${result}=    addition    2    4 
    ${moyenne}=    Division    ${result}    2
    Should Be Equal As Numbers   ${moyenne}    3

Division par zéro
    ${result}=    Division    5    0
    Should Be Equal As Numbers   ${result}    0

Calcul circonférence
    ${result}=    Multiplication    ${PI}    10
    ${result}=    Multiplication    ${result}    2
    Should Be Equal As Numbers   ${result}    62.8318    0.0001
Calcul moyenne 2 notes eleve
    ${result}=    addition    ${liste notes}[0]    ${liste notes}[1]
    ${moyenne}=    Division    ${result}    2
    Should Be Equal As Numbers   ${moyenne}    13.5
    Log To Console   L'élève ${eleve}[nom] ${eleve}[prenom] a une moyenne de ${moyenne}
Affichage répertoire
    Log To Console   ${\n} Répertoire courant: ${CURDIR}
    Log To Console   ${\n} Répertoire exécution: ${EXECDIR}
    Log To Console   ${\n} Répertoire temporaire: ${TEMPDIR}

comparer ${80} a 80
    Should Be Equal    ${80}    80