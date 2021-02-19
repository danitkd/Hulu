sub init()
    m.email = m.top.findNode("email")
    m.password = m.top.findNode("password")
    m.keyBoard = m.top.findNode("keyBoard")
    m.buttonLogin = m.top.findNode("buttonlogin")
    m.infoRectangle = m.top.findNode("inforectangle")
    m.infoText = m.top.findNode("infotext")

    m.email.selected = true
    m.keyBoard.textEditBox.visible = false 
    m.keyBoard.observeField("text", "sendText")
    sendText()
    m.email.setFocus(true)
end sub  


function onKeyEvent(key as String, press as Boolean) as Boolean
    ?"😐 profileLogin :: onKeyEvent ";key;" - press: ";press 
    handled = false
    if press then
        if (key = "OK" or key = "right" and m.emailRectangle.hasFocus()) then 
            m.keyBoard.visible = true
            m.keyBoard.setFocus(true)
            m.infoRectangle.visible = false
            m.infoText.visible = false
            m.buttonLogin.visible = false
            alignTextComponents()
            handled = true
        else if (key = "back") then 
            m.email.selected = true
            m.keyBoard.visible = false 
            m.infoRectangle.visible = true
            m.infoText.visible = true
            m.buttonLogin.visible = true 
            handled = true
        else if (key = "down") then 
            if m.email.selected then    'solo estoy diciendo que si lo tengo seleccionado
                m.email.selected = false 
                m.password.selected = true
                m.password.setFocus(true)
            else if m.password.selected then
                m.password.selected = false
                m.buttonLogin.setFocus(true)
            end if
            handled = true  
        else if (key = "up") then 
            if m.buttonLogin.hasFocus() then    
                m.password.selected = true
                m.password.setFocus(true)
            else if m.password.hasFocus() then
                m.password.selected = false
                m.email.selected = true
                m.email.setFocus(true)
            end if
            handled = true  
        end if   
    end if

    return handled  
end function        

sub sendText()
    if m.email.selected = true then 
        m.email.text = m.keyBoard.text
    else
        m.password.text = m.keyBoard.text  
        'm.password.secureMode = true
    end if 
end sub

sub alignTextComponents()
    if not m.email.isInFocusChain() then 
        m.keyBoard.text = m.password.text
    else 
        m.keyBoard.text = m.email.text
    end if 
end sub

' TODO: unobserve field when the user is logged in