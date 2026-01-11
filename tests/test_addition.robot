*** Settings ***
Library    ../librairies/calculette.py
Test Template    modele addition
*** Test Cases ***
Addition de 1 et 2
    1    2    3
Addition de 10 et 15
    10    15    25
Addition de -5 et 5
    -5    5    0
*** Keywords ***
modele addition
    [Arguments]    ${a}    ${b}    ${resultat_attendu}
    ${result}=    addition    ${a}    ${b}
    Should Be Equal As Numbers   ${result}    ${resultat_attendu}