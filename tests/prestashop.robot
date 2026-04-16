*** Settings ***
Resource  ${CURDIR}/../resources/prestashop.resource
Test Setup  ouvrir prestashop
Test Teardown  fermer prestashop
*** Test Cases ***
test de connexion
    Title Should Be    monPrestaShop

