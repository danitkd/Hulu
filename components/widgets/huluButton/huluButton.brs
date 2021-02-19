sub init()
    m.loginRectangle = m.top.findNode("rectangle") 
    m.loginText = m.top.findNode("label")

    m.top.observeField("focusedChild","onButtonFocusChanged")
end sub

sub onButtonFocusChanged()   '
    if m.top.isInFocusChain() then 
        m.loginRectangle.color = "0xd8d8d8"   'blanquzco
        m.loginText.color = "0x1c1c1c"        'negro
    else 
        m.loginRectangle.color = "0XBDBDBD"  'gris
        m.loginText.color = "0XFFFFFF"        'blanco 
    end if 
end sub 