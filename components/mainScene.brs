sub init()
    m.top.backgroundURI = "pkg:/images/fondo.png"
    m.profileLogin = m.top.findNode("profileLogin")
    m.homeView = m.top.findNode("homeView")
    m.homeView.visible = false
    m.profileLogin.setFocus(true)
end sub

sub displayHome()
    m.homeView.setFocus(true)
    m.homeView.visible = true
    m.profileLogin.visible = false
end sub
