sub init()
    m.loginRectangle = m.top.findNode("loginrectangle") 
    m.loginText = m.top.findNode("logintext")

    m.top.observedField("focusedChild","onFocusChanged")
end sub

sub onFocusChanged()
    if m.top.isFocusChild then 
        m.loginRectangle.color = "0XF2F2F2"   'blanquzco
        m.loginText.color = "0X0B2161"        'azul oscuro
    else 
        m.loginRectangle.color = "0XBDBDBD"  'gris
        m.loginText.color = "0XFFFFFF"        'blanco 
    end if 
end sub 