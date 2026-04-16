*** Settings ***
Resource  ${CURDIR}/../resources/chuckNorris.resource
Test Setup  initialiser session
Test Teardown  finir la session


*** Test Cases ***
verifier chuck blague au hasard
    ${blague}    obtenir une blague aléatoire
    Log To Console  la blague: ${blague}
    Should Contain  ${blague}  Chuck
verifier blague animal
    ${blague}  obtenir une blague aléatoire avec animal
    Log To Console  la blague: ${blague}
    Should Contain  ${blague}  Chuck
verifier toutes categories
    @{categories}    recuperer les categories
    FOR    ${cat}    IN    @{categories}
        ${blague}  ${category}  obtenir une blague aléatoire avec ${cat}
        Log To Console    blague: ${blague}
        Should Be Equal  ${cat}    ${category}
        Should Contain  ${blague}  Chuck  ignore_case=True
    END