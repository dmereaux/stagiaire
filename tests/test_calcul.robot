*** Settings ***
Library    ../librairies/calculette.py
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