*** Settings  ***

*** Variables  ***
*** Test Cases  ***
Concatenation de deux chaînes de caractères
    [Documentation]    Teste la concaténation de deux chaînes de caractères.
    ${result}    Catenate    Hello     World
    Should Be Equal   ${result}    HelloWorld