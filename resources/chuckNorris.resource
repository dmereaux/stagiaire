*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
*** Variables ***
${URL}    https://api.chucknorris.io
${SESSION}    chucknorris
${BLAGUE AU HASARD}  /jokes/random
${CATEGORIES}    /jokes/categories

*** Keywords ***
initialiser session
    Create Session    ${SESSION}    ${URL}  verify=True
finir la session
    Delete All Sessions
obtenir une blague aléatoire
    ${response}=    Get on session    ${SESSION}    ${BLAGUE AU HASARD}
    ${blague}  get value from json    ${response.json()}    $.value
#    ${blague}  Get From Dictionary    ${response.json()}    value
#    RETURN    ${response.json()}[value]
    RETURN    ${blague}[0]
obtenir une blague aléatoire avec ${categorie}
    ${response}=    Get on session    ${SESSION}    ${BLAGUE AU HASARD}  params=category=${categorie}
    ${blague}  get value from json    ${response.json()}    $.value
    should Contain  ${response.json()}[categories]  ${categorie}
    RETURN    ${blague}[0]  ${response.json()}[categories][0]
recuperer les categories
    ${response}=    Get on session    ${SESSION}    ${CATEGORIES}
    RETURN    ${response.json()}