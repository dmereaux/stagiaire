*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    http://prestashop.qualifiez.fr
${BROWSER}    Chrome
${LOC_CHAMPRECHERCHE}    xpath=//*[@id="search_widget"]/form/input[2]
${LOC_RESULTATRECHERCHE}    xpath=//*[@id="js-product-list-top"]/div[1]/p
${LOC_MESSAGEERREUR}    xpath=//*[@id="product-search-no-matches"]
${LOC_LIEN_VETEMENTS}    xpath=//*[@id="category-3"]/a
${LOC_LIEN_FEMMES}    xpath=//*[@id="category-5"]/a

*** Keywords ***
ouvrir prestashop
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window    
fermer prestashop
    Close Browser
rechercher un produit
    [Arguments]    ${produit}
    Input Text    ${LOC_CHAMPRECHERCHE}    ${produit}
    Press Keys    ${LOC_CHAMPRECHERCHE}    RETURN
verifier resultat recherche
    [Arguments]    ${resultat}
    Wait Until Element Is Visible    ${LOC_RESULTATRECHERCHE}    timeout=5s
    Element Text Should Be  ${LOC_RESULTATRECHERCHE}    ${resultat}
verifier message d'erreur
    [Arguments]    ${message}=Aucun produit ne correspond à votre recherche
    Wait Until Element Is Visible    ${LOC_MESSAGEERREUR}    timeout=5s
    Element Text Should Be  ${LOC_MESSAGEERREUR}    ${message}
quand je survole le lien vêtements
    Mouse Over    ${LOC_LIEN_VETEMENTS} 
le lien femmes doit être visible
    Wait Until Element Is Visible    ${LOC_LIEN_FEMMES}  5
