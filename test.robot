*** Settings ***
Library     Browser
Documentation

*** Variables ***
${URL}          https://www.google.com/
${SEARCH_FIELD}         //input[@name="q"]        

*** Keywords ***
GetCheck
    ${GetTextforVerify}           Get Text          //*[@id="rso"]/div[3]/div/div[1]/div/a/h3
    RETURN          ${GetTextforVerify}

Open Google Web
    Open Browser       ${URL}

Input Data 1
    Fill Text           ${SEARCH_FIELD}          เรือดำน้ำ

Input Data 2
    Fill Text           ${SEARCH_FIELD}          submarine

Click Button Search
    Click               //form[@role="search"]/div/div/div[2]//*[@name="btnK"]

Click Link 3
    Click               //*[@id="search"]/div/div/div[3]/div/div/div/a

Delete Data in Search Box
    Clear Text          ${SEARCH_FIELD}

*** Test Cases ***

Test Search Google (Google 001)
    Open Google Web
    Input Data 1
    Sleep       1.5s
    Click Button Search
    Sleep       1.5s
    ${forEqual}      GetCheck         
    Should Be Equal           ${forEqual}           เรือดำน้ำ - วิกิพีเดีย 
    Sleep       2s

Search Google 3th Link (Google 003)
    Open Google Web
    Input Data 1
    Sleep       1.5s
    Click Button Search
    Sleep       1.5s
    ${forEqual}      GetCheck         
    Should Be Equal           ${forEqual}           เรือดำน้ำ - วิกิพีเดีย 
    Sleep       1.5s
    Click Link 3
    Sleep       2s
    







    

