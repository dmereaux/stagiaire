*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    http://prestashop.qualifiez.fr
${BROWSER}    Chrome
*** Keywords ***
ouvrir prestashop
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window    
fermer prestashop
    Close Browser
