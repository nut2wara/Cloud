*** Settings ***

Documentation  A test for loop
Resource       resource.robot
Library        String

*** Variables ***
@{FILE TYPE} =    ${EMPTY}    photo    video    drive    other    folder
@{FILE STATUS} =    ${EMPTY}    status=public_enable_download    status=public_disable_download    status=private

@{SORT BY} =    sort=datetime_create&flip=desc    sort=datetime_create&flip=asc    sort=last_view&flip=desc


*** Test Cases ***
TC044       #est
    Open Browser To CLOUD Page
#    Input Username     wisit.i@23perspective.com
#    Input Password     1234
    Input Username      iguz@windowslive.com
    Input Password      1234
#    Input Username     oat@hotmail.com
#    Input Password     1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    COMPARE SORT BY NO UPLOAD FILE    ${PATH}    @{SORT BY}

    Set Window Size     ${480}      ${640}

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    COMPARE SORT BY NO UPLOAD FILE    ${PATH}    @{SORT BY}

    [Teardown]  Close Browser

TC045
    Open Browser To CLOUD Page
#    Input Username    wisit.i@23perspective.com
#    Input Password    1234
    Input Username    iguz@windowslive.com
    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    COMPARE SORT BY NO UPLOAD FILE    ${PATH}    @{SORT BY}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    COMPARE SORT BY NO UPLOAD FILE    ${PATH}    @{SORT BY}

    [Teardown]  Close Browser

TC046
    Open Browser To CLOUD Page
    Input Username    wisit.i@23perspective.com
    Input Password    1234
#    Input Username    iguz@windowslive.com
#    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    COMPARE SORT BY WITH UPLOAD FILE    ${PATH}    @{SORT BY}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    COMPARE SORT BY WITH UPLOAD FILE    ${PATH}    @{SORT BY}
    [Teardown]  Close Browser

TC047
    Open Browser To CLOUD Page
    Input Username    wisit.i@23perspective.com
    Input Password    1234
#    Input Username    iguz@windowslive.com
#    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    COMPARE SORT BY WITH UPLOAD FILE    ${PATH}    @{SORT BY}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    COMPARE SORT BY WITH UPLOAD FILE    ${PATH}    @{SORT BY}

    [Teardown]  Close Browser

TC048
    Open Browser To CLOUD Page
#    Input Username    wisit.i@23perspective.com
#    Input Password    1234
    Input Username    iguz@windowslive.com
    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILTER NO UPLOAD FILE    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILTER NO UPLOAD FILE    ${PATH}    @{FILE STATUS}

    [Teardown]  Close Browser

TC049
    Open Browser To CLOUD Page
#    Input Username    wisit.i@23perspective.com
#    Input Password    1234
    Input Username    iguz@windowslive.com
    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILTER NO UPLOAD FILE    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILTER NO UPLOAD FILE    ${PATH}    @{FILE STATUS}

    [Teardown]  Close Browser

TC050
    Open Browser To CLOUD Page
    Input Username    wisit.i@23perspective.com
    Input Password    1234
#    Input Username    iguz@windowslive.com
#    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILTER WITH UPLOAD FILE    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILTER WITH UPLOAD FILE    ${PATH}    @{FILE STATUS}


    [Teardown]  Close Browser

TC051
    Open Browser To CLOUD Page
    Input Username    wisit.i@23perspective.com
    Input Password    1234
#    Input Username    iguz@windowslive.com
#    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILTER WITH UPLOAD FILE    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILTER WITH UPLOAD FILE    ${PATH}    @{FILE STATUS}


    [Teardown]  Close Browser

TC052
    Open Browser To CLOUD Page
#    Input Username    wisit.i@23perspective.com
#   Input Password    1234
    Input Username    iguz@windowslive.com
    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILETER SORT NO UPLOAD    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILETER SORT NO UPLOAD    ${PATH}    @{FILE STATUS}

    [Teardown]  Close Browser

TC053
    Open Browser To CLOUD Page
#    Input Username    wisit.i@23perspective.com
#   Input Password    1234
    Input Username    iguz@windowslive.com
    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILETER SORT NO UPLOAD     ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILETER SORT NO UPLOAD     ${PATH}    @{FILE STATUS}

    [Teardown]  Close Browser

TC054
    Open Browser To CLOUD Page
    Input Username    wisit.i@23perspective.com
    Input Password    1234
#    Input Username    iguz@windowslive.com
#    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILETER SORT WITH UPLOAD    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/list/    ${ELEMENT}
	\    FOREACH FILETER SORT WITH UPLOAD    ${PATH}    @{FILE STATUS}
    [Teardown]  Close Browser

TC055
    Open Browser To CLOUD Page
    Input Username    wisit.i@23perspective.com
    Input Password    1234
#    Input Username    iguz@windowslive.com
#    Input Password    1234
#    Input Username    oat@hotmail.com
#    Input Password    1234
    Submit Signin

	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILETER SORT WITH UPLOAD    ${PATH}    @{FILE STATUS}

    Set Window Size     ${480}      ${640}
	:FOR    ${ELEMENT}   IN    @{FILE TYPE}
	\    ${PATH}=    Catenate    SEPARATOR=     ${MYCLOUD URL}    /index/thumb/    ${ELEMENT}
	\    FOREACH FILETER SORT WITH UPLOAD    ${PATH}    @{FILE STATUS}

    [Teardown]  Close Browser
