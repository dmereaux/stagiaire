*** Settings ***
Resource  ${CURDIR}/../resources/chuckNorris.resource
Test Setup  initialiser session
Test Teardown  finir la session


*** Test Cases ***
verifier chuck blague au hasard
    ${blague}    obtenir une blague aléatoire
    Log To Console  la blague: ${blague}
    Should Contain  ${blague}  Chuck
