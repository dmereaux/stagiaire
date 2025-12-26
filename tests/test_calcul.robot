*** Settings ***
Library    ../librairies/calculette.py
*** Test Cases ***
Addition de deux nombres
    ${result}=    addition    5    3
    Should Be Equal As Numbers   ${result}    8