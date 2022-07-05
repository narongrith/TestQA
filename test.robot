*** Settings ***
Library     Browser
Documentation

*** Variables ***
${URL}          https://www.google.com/
${SEARCH_FIELD}         //input[@name="q"]        

*** Keywords ***
GetCheck Search 1
    ${forVerifySearch}           Get Text          //*[@data-attrid="subtitle"]
    RETURN          ${forVerifySearch}

GetCheck Link 3
    ${forVerifyLink3}            Get Text           //*[@id="mySidenav"]/div/ul/li[3]/span//*[@href="/news/ยานยนต์"]
    RETURN            ${forVerifyLink3}

GetCheck Link 4
    ${forVerifyLink4}            Get Text             //*[@id="orb-nav-more"]/a/span[1]
    RETURN            ${forVerifyLink4}

GetCheck Link 5
    ${forVerifyLink5}            Get Text             //*[@href="/"]
    RETURN            ${forVerifyLink5}

Open Google Web
    Open Browser       ${URL}

Input Data 1
    Fill Text           ${SEARCH_FIELD}          เรือดำน้ำ

Input Data 2
    Fill Text           ${SEARCH_FIELD}          submarine

Click Button Search
    Click               //form[@role="search"]/div/div/div[2]//*[@name="btnK"]

Click Link 3
    Click               //*[@id="rso"]/div[4]/div/div/div/a

Click Link 4            
    Click               //*[@id="search"]/div/div/div[6]/div/div/div/a

Click Link 5            
    Click               //*[@data-hveid="CEEQAA"]/div/div/div/div/div/div/a

Delete Data in Search Box
    Clear Text          ${SEARCH_FIELD}

*** Test Cases ***
Test Search Google (Google 001)
    Open Google Web
    Input Data 1
    Sleep       1s
    Click Button Search
    Sleep       1s
    ${forEqualSearch}               GetCheck Search 1    
    Should Be Equal           ${forEqualSearch}                ประเภทเรือ
    Sleep       1s

Search Google 3th Link (Google 003)
    Open Google Web
    Input Data 1
    Sleep       1s
    Click Button Search
    Sleep       1s
    ${forEqualSearch}               GetCheck Search 1    
    Should Be Equal           ${forEqualSearch}                ประเภทเรือ
    Sleep       1s
    Click Link 3
    ${forEqualLink3}                GetCheck Link 3
    Should Be Equal           ${forEqualLink3}                  ยานยนต์   
    Sleep       1.5s


Search Google more then Link (Google 004)
    Open Google Web
    Input Data 1
    Sleep       1s
    Click Button Search
    Sleep       1s
    ${forEqualSearch}               GetCheck Search 1    
    Should Be Equal           ${forEqualSearch}                ประเภทเรือ
    Sleep       1s
    Click Link 3
    ${forEqualLink3}                GetCheck Link 3
    Should Be Equal           ${forEqualLink3}                  ยานยนต์   
    Sleep       1s
    Go Back
    Click Link 4
    Sleep       1s
    ${forEqualLink4}                 GetCheck Link 4
    Should Be Equal           ${forEqualLink4}                  เมนู
    Sleep       1s


    







    

