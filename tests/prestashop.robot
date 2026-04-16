*** Settings ***
Resource  ${CURDIR}/../resources/prestashop.resource
Test Setup  ouvrir prestashop
Test Teardown  fermer prestashop
*** Test Cases ***
test de connexion
    Title Should Be    monPrestaShop

test de recherche
    rechercher un produit    MUG
    verifier resultat recherche    Il y a 5 produits.
test de recherche avec message d'erreur
    rechercher un produit    ${EMPTY}
    verifier message d'erreur    Aucun produit ne correspond à votre recherche
