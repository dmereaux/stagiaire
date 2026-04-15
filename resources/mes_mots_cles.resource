*** Settings ***
Library    ${CURDIR}/../librairies/calculette.py
*** Keywords ***    
Plus 10
    [Documentation]    plus 10
    [Arguments]    ${valeur}=3
    Log    addition avec 10    INFO
    ${somme}    Addition    ${valeur}    10
    RETURN    ${somme}