sub init()
    m.top.backgroundURI = "pkg:/images/fondo.png"
    m.profileLogin = m.top.findNode("profileLogin")
    m.homeView = m.top.findNode("homeView")
    m.homeView.visible = false
    m.profileLogin.setFocus(true)
    addGlobalFields()
end sub

sub addGlobalFields()
    m.global.addField("token","string", true)    'el true, es el always notify, al hacer esto al inicio aseguro que global tiene un campo llamado token
end sub

sub displayHome()
    m.homeView.callFunc("createTask")
    m.homeView.setFocus(true)
    m.homeView.visible = true
    m.profileLogin.visible = false
end sub
