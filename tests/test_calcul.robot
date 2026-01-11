*** Settings ***
Library    ../librairies/calculette.py
Test Setup    Log To Console    Début du test 
Test Teardown    Log To Console    Fin du test : ${TEST NAME} avec le statut ${TEST STATUS}
Suite Setup    Log To Console    Début de la suite de tests
Suite Teardown    Log To Console    Fin de la suite de tests   
Documentation    Ceci est le fichier test_calcul.robot qui contient des tests pour la calculette.
*** Variables ***
${PI}    3.14159
@{liste notes}    12    15    14    10    9
&{eleve}    nom=Dupont    prenom=Jean    
${nombre_notes}    5
${total}    0
*** Test Cases ***
Addition de deux nombres
    [Documentation]    Teste l'addition de deux nombres entiers.
    ${result}=    addition    5    3
    Should Be Equal As Numbers   ${result}    8
Soustraction de deux nombres
    [Documentation]    Teste la soustraction de deux nombres décimaux.    
    ${result}=    soustraction    10.2        4
    Should Be Equal As Numbers   ${result}    6.2
Moyenne de 2 nombres
    [Documentation]    Teste le calcul de la moyenne de deux nombres.
    ${result}=    addition    2    4 
    ${moyenne}=    Division    ${result}    2
    Should Be Equal As Numbers   ${moyenne}    3

Division par zéro
    [Documentation]    Teste la division par zéro.
    ${result}=    Division    5    0
    Should Be Equal As Numbers   ${result}    0

Calcul circonférence
    [Documentation]    Teste le calcul de la circonférence d'un cercle de rayon 10.
    [Tags]  regression
    ${result}=    Multiplication    ${PI}    10
    ${result}=    Multiplication    ${result}    2
    Should Be Equal As Numbers   ${result}    62.8318    0.0001
Calcul moyenne 2 notes eleve
    [Documentation]    Teste le calcul de la moyenne de deux notes pour un élève.
    ${result}=    addition    ${liste notes}[0]    ${liste notes}[1]
    ${moyenne}=    Division    ${result}    2
    Should Be Equal As Numbers   ${moyenne}    13.5
    Log To Console   L'élève ${eleve}[nom] ${eleve}[prenom] a une moyenne de ${moyenne}
Affichage répertoire
    [Documentation]    Affiche les répertoires courants, d'exécution et temporaire.
    [Tags]  regression
    Log To Console   ${\n} Répertoire courant: ${CURDIR}
    Log To Console   ${\n} Répertoire exécution: ${EXECDIR}
    Log To Console   ${\n} Répertoire temporaire: ${TEMPDIR}

comparer ${80} a 80
    [Documentation]    Compare la valeur ${80} à 80 avec gestion de l'erreur.
    [Tags]  robot:continue-on-failure
    Should Be Equal    ${80}    80
    Log To Console   Les deux valeurs sont égales 

test addition avec modele
    [Documentation]    Teste l'addition en utilisant un mot-clé modèle.
    [Template]    modele addition
    4    6    10
    7    3    10
    0    0    0
    -2   2    0    

test calcul moyenne liste notes
    [Documentation]    Teste le calcul de la moyenne d'une liste de notes.
    FOR    ${note}    IN    @{liste notes}
        ${total}=    addition    ${total}    ${note}
    END
    ${moyenne}=    Division    ${total}    ${nombre_notes}
    Should Be Equal As Numbers   ${moyenne}    12
    Log To Console   La moyenne des notes est ${moyenne}

*** Keywords ***
modele addition
    [Arguments]    ${a}    ${b}  ${expected}    
    ${result}=    addition    ${a}    ${b}
    Should Be Equal As Numbers   ${result}    ${expected}