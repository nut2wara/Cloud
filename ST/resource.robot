*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        tc-uat.23perspective.com
${BROWSER}       firefox
${DELAY}         0
${CLOUD URL}     https://${SERVER}/storage/my_cloud
${CLOUD LOGIN}     https://${SERVER}/portal/user/login
${MYCLOUD URL}     https://${SERVER}/storage/my_cloud


*** Keywords ***

Open Browser To CLOUD Page
    Open Browser  ${CLOUD LOGIN}  ${BROWSER}

Open Url 
	[Arguments]    ${url}    
	Go To    ${url}
	
Input Username  
    [Arguments]  ${username}
    Input Text  email  ${username}

Input Password  [Arguments]  ${password}
    Input Text  password  ${password}

Submit Signin
	Click Element  xpath=//button[@type='submit']

Welcome Page Should Be Open
    [Arguments]    ${url}
    Location Should Be  ${url}


COMPARE SORT BY WITH UPLOAD FILE
    [Arguments]    ${url}    @{items}
	:FOR    ${ELEMENT}    IN    @{items}
    \    ${SORT}=    Catenate    SEPARATOR=     ${url}   ?   ${ELEMENT}
	\    Open Url    ${SORT}
#	\    ${status}    ${value}=    Run Keyword And Ignore Error    Welcome Page Should Be Open    ${SORT}
#	\    ${elem}=    Get Text   dom=document.getElementById('sortdate_0')
	\    ${count}=    Get Matching Xpath Count    xpath=//ul[@class='list-body']
	\    Continue For Loop If     ${count} <= 1
	\    ${fir_elem}=    Get Element Attribute    id=sortdate_0@value
	\    ${sec_elem}=    Get Element Attribute    id=sortdate_1@value
	\    Run Keyword If    '${ELEMENT}'=='sort=datetime_create&flip=desc'    Should Be True    ${fir_elem} >= ${sec_elem}
	\    Run Keyword If    '${ELEMENT}'=='sort=datetime_create&flip=asc'    Should Be True    ${fir_elem} <= ${sec_elem}
    \    Run Keyword If    '${ELEMENT}'=='sort=last_view&flip=desc'    Should Be True    ${fir_elem} >= ${sec_elem}


COMPARE SORT BY NO UPLOAD FILE
    [Arguments]    ${url}    @{items}
	:FOR    ${ELEMENT}    IN    @{items}
    \    ${SORT}=    Catenate    SEPARATOR=     ${url}   ?   ${ELEMENT}
	\    Open Url    ${SORT}
#	\    ${status}    ${value}=    Run Keyword And Ignore Error    Welcome Page Should Be Open    ${SORT}
#	\    ${elem}=    Get Text   dom=document.getElementById('sortdate_0')
	\    ${count}=    Get Matching Xpath Count    xpath=//ul[@class='list-body']
	\    Should Be True     ${count} == 0
	\    ${msg}=    Get Matching Xpath Count    xpath=//div[@id='upload_btn']
	\	 Should Be True     ${msg} == 1
	\    ${data}=    Get Text     id=upload_btn
	\	 Should Contain    ${data}    Select file to upload


FOREACH FILTER NO UPLOAD FILE
    [Arguments]    ${url}    @{status}
	:FOR    ${ELEMENT}    IN    @{status}
    \    ${url_status}=    Catenate    SEPARATOR=     ${url}   ?   ${ELEMENT}
#	\    FILTER WITH UPLOAD FILE    ${url_status}    ${ELEMENT}
	\    FILTER NO UPLOAD FILE    ${url_status}    ${ELEMENT}

FOREACH FILTER WITH UPLOAD FILE
    [Arguments]    ${url}    @{status}
	:FOR    ${ELEMENT}    IN    @{status}
    \    ${url_status}=    Catenate    SEPARATOR=     ${url}   ?   ${ELEMENT}
	\    FILTER WITH UPLOAD FILE    ${url_status}    ${ELEMENT}
#	\    FILTER NO UPLOAD FILE    ${url_status}    ${ELEMENT}

FOREACH FILETER SORT NO UPLOAD
    [Arguments]    ${url}    @{status}
	:FOR    ${ELEMENT}    IN    @{status}
    \    ${url_status}=    Catenate    SEPARATOR=     ${url}   ?   ${ELEMENT}
#	\    FILTER SORT BY WITH UPLOAD FILE    ${url_status}    ${ELEMENT}    @{SORT BY}
	\    FILTER SORT BY NO UPLOAD FILE    ${url_status}    ${ELEMENT}    @{SORT BY}

FOREACH FILETER SORT WITH UPLOAD
    [Arguments]    ${url}    @{status}
	:FOR    ${ELEMENT}    IN    @{status}
    \    ${url_status}=    Catenate    SEPARATOR=     ${url}   ?   ${ELEMENT}
	\    FILTER SORT BY WITH UPLOAD FILE    ${url_status}    ${ELEMENT}    @{SORT BY}
#	\    FILTER SORT BY NO UPLOAD FILE    ${url_status}    ${ELEMENT}    @{SORT BY}

FILTER WITH UPLOAD FILE
    [Arguments]    ${url}    ${status}

    ${SORT}=    Catenate    SEPARATOR=     ${url}
	Open Url    ${SORT}
#	${status}    ${value}=    Run Keyword And Ignore Error    Welcome Page Should Be Open    ${SORT}
#	${elem}=    Get Text   dom=document.getElementById('sortdate_0')
	${count}=    Get Matching Xpath Count    xpath=//ul[@class='list-body']
	Continue For Loop If     ${count} <= 1
	${fir_status}=    Get Element Attribute    id=status_0@value
	${sec_status}=    Get Element Attribute    id=status_1@value
	Continue For Loop If    '${status}'=='${EMPTY}'

	Run Keyword If    '${status}'=='status=public_enable_download'    Should Contain    ${fir_status}    Public & Enable
	Run Keyword If    '${status}'=='status=public_enable_download'    Should Contain    ${sec_status}    Public & Enable
	Run Keyword If    '${status}'=='status=public_disable_download'    Should Contain    ${fir_status}    Public & Disable
	Run Keyword If    '${status}'=='status=public_disable_download'    Should Contain    ${sec_status}    Public & Disable
	Run Keyword If    '${status}'=='status=private'    Should Contain    ${fir_status}    Private
	Run Keyword If    '${status}'=='status=private'    Should Contain    ${sec_status}    Private


FILTER NO UPLOAD FILE
    [Arguments]    ${url}    ${status}
    ${SORT}=    Catenate    SEPARATOR=     ${url}
	Open Url    ${SORT}
#	${status}    ${value}=    Run Keyword And Ignore Error    Welcome Page Should Be Open    ${SORT}
#	${elem}=    Get Text   dom=document.getElementById('sortdate_0')
	${count}=    Get Matching Xpath Count    xpath=//ul[@class='list-body']
	Should Be True     ${count} == 0
	${msg}=    Get Matching Xpath Count    xpath=//div[@id='upload_btn']
	Should Be True     ${msg} == 1
	${data}=    Get Text     id=upload_btn
	Should Contain    ${data}    Select file to upload


FILTER SORT BY WITH UPLOAD FILE
    [Arguments]    ${url}    ${status}    @{sort by}
	:FOR    ${ELEMENT}    IN    @{sort by}
    \    ${SORT}=    Catenate    SEPARATOR=     ${url}   &   ${ELEMENT}
	\    Open Url    ${SORT}
#	\    ${status}    ${value}=    Run Keyword And Ignore Error    Welcome Page Should Be Open    ${SORT}
#	\    ${elem}=    Get Text   dom=document.getElementById('sortdate_0')
	\    ${count}=    Get Matching Xpath Count    xpath=//ul[@class='list-body']
	\    Continue For Loop If     ${count} <= 1
	\	 ${fir_status}=    Get Element Attribute    id=status_0@value
	\	 ${sec_status}=    Get Element Attribute    id=status_1@value
	\	 Continue For Loop If    '${status}'=='${EMPTY}'
	\    Run Keyword If    '${status}'=='status=public_enable_download'    Should Contain    ${fir_status}    Public & Enable
	\    Run Keyword If    '${status}'=='status=public_enable_download'    Should Contain    ${sec_status}    Public & Enable
	\    Run Keyword If    '${status}'=='status=public_disable_download'    Should Contain    ${fir_status}    Public & Disable
	\    Run Keyword If    '${status}'=='status=public_disable_download'    Should Contain    ${sec_status}    Public & Disable

	\    Run Keyword If    '${status}'=='status=private'    Should Contain    ${fir_status}    Private
	\    Run Keyword If    '${status}'=='status=private'    Should Contain    ${sec_status}    Private

	\    ${fir_elem}=    Get Element Attribute    id=sortdate_0@value
	\    ${sec_elem}=    Get Element Attribute    id=sortdate_1@value
	\    Run Keyword If    '${ELEMENT}'=='sort=datetime_create&flip=desc'    Should Be True    ${fir_elem} >= ${sec_elem}
	\    Run Keyword If    '${ELEMENT}'=='sort=datetime_create&flip=asc'    Should Be True    ${fir_elem} <= ${sec_elem}
    \    Run Keyword If    '${ELEMENT}'=='sort=last_view&flip=desc'    Should Be True    ${fir_elem} >= ${sec_elem}



FILTER SORT BY NO UPLOAD FILE
    [Arguments]    ${url}    ${status}    @{sort by}
	:FOR    ${ELEMENT}    IN    @{sort by}
    \    ${SORT}=    Catenate    SEPARATOR=     ${url}   &   ${ELEMENT}
	\    Open Url    ${SORT}
#	\    ${status}    ${value}=    Run Keyword And Ignore Error    Welcome Page Should Be Open    ${SORT}
#	\    ${elem}=    Get Text   dom=document.getElementById('sortdate_0')
	\    ${count}=    Get Matching Xpath Count    xpath=//ul[@class='list-body']
	\    Should Be True     ${count} == 0
	\    ${msg}=    Get Matching Xpath Count    xpath=//div[@id='upload_btn']
	\	 Should Be True     ${msg} == 1
	\    ${data}=    Get Text     id=upload_btn
	\	 Should Contain    ${data}    Select file to upload
