sub init()
    m.emailRectangle = m.top.findNode("emailrectangle")
    m.lineEmail = m.top.findNode("frontemailrectangle")
    m.passwordRectangle = m.top.findNode("passwordrectangle")
    m.linePassword = m.top.findNode("frontpasswordrectangle")
    m.keyBoard = m.top.findNode("keyboard")
    m.textRectangle = m.top.findNode("textrectangle")
    m.text = m.top.findNode("text")
    m.loginRectangle = m.top.findNode("loginrectangle")
    m.loginText = m.top.findNode("loginText")
    m.email = m.top.findNode("textemail")
    m.password = m.top.findNode("textpassword")

    m.lineEmail.setFocus(true)    
end sub  


function onKeyEvent(key as String, press as Boolean) as Boolean
    ?"😐profileLogin😐";key 
    handled = false
    if press then
        if (key = "OK" or key = "right" and m.lineEmail.hasFocus()) then  'cuando presione OK donde, como poner rectangle1?
            m.keyBoard.visible = true
            m.keyBoard.setFocus(true)
            m.textRectangle.visible = false
            m.text.visible = false
            m.loginRectangle.visible = false
            m.loginText.visible = false
            m.emailRectangle.visisble = false
            handled = true
        else if (key = "back") then 
            m.lineEmail.setFocus(true)
            m.keyBoard.visible = false 
            m.textRectangle.visible = true
            m.text.visible = true
            m.loginRectangle.visible = true
            m.loginText.visible = true
            m.emailRectangle.visible = true 
            handled = true
        else if (key = "down") then 
            m.linePassword.visible = true
            m.emailRectangle.visible = true
            m.lineEmail.visible = false 
            handled = true  
        else if (key = "up") then 
            m.linePassword.visible = false
            m.lineEmail.visible = true
            handled = true  
        end if   
    end if

    return handled  

end function        

sub sendText()
   m.info = m.keyBoard.text
   m.email.text = m.info
end sub