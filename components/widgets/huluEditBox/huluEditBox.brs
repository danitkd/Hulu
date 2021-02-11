sub init()
    m.rectangle = m.top.findNode("rectangle")
    m.textComponent = m.top.findNode("textComponent")
    m.title = m.top.findNode("title")
    m.show = m.top.findNode("showText")
    m.textComponent.observeField("text", "onTextChanged")
end sub

sub onSelectedChanged()
    if m.top.selected then
        m.rectangle.visible = true
        m.show.visible = true
    else
        m.rectangle.visible = false
        m.show.visible = false
    end if
end sub

sub onTextChanged()
    if m.top.secureMode then
        m.textComponent.text = "*****"
    end if
end sub