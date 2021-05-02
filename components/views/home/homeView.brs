sub init()
    m.rowlist = m.top.findNode("rowlist")
    m.video = m.top.findNode("video")    
    m.rowList.observeField("rowItemSelected", "onRowItemSelectedChanged")
end sub

sub createTask()
    ?"working in the task"
    m.moviesTask = CreateObject("roSGNode", "RequestTask")
    m.moviesTask.token = m.global.token 'aqui le paso a token que es un field de la tarea lo de la global
    m.moviesTask.observeField("outputNode", "onContentReceived")
    m.moviesTask.functionName = "requests"
    m.moviesTask.control = "RUN" 'aqui ejecuta lo que este en el FN
end sub 

sub onContentReceived()
    ?"onContentReceived()";m.moviesTask.outputNode  
    m.rowList.content = m.moviesTask.outputNode 'de donde lo va a agarrar
    m.moviesTask.control = "STOP"
    m.moviesTask.unobserveField("outputNode")
    m.moviesTask = invalid
    m.rowList.setFocus(true)
end sub

sub onRowItemSelectedChanged()
    ?"onRowItemSelectedChanged() ";m.rowList.rowItemSelected
    index = m.rowList.rowItemSelected    
    item = m.rowList.content.getChild(index[0]).getChild(index[1])
    title = item.title
    id = item.id 
    createStreamTask(id, title) 
    ?"😍";id
end sub

sub createStreamTask(id, title)
    ?"working in the stream task"
    m.streamTask = CreateObject("roSGNode", "RequestTask")
    m.streamTask.token = m.global.token 'aqui le paso a token que es un field de la tarea lo de la global
    m.streamTask.id = id
    m.streamTask.title = title
    m.streamTask.observeField("outputNode", "onStreamReceived")
    m.streamTask.functionName = "getStream"
    m.streamTask.control = "RUN" 
end sub

sub onStreamReceived()  
    ?"onStreamReceived()"  
    m.video.content = m.streamTask.outputNode
    m.streamTask.control = "STOP"
    m.streamTask.unobserveField("outputNode")
    m.streamTask = invalid
    m.video.visible = true
    m.video.control = "play"
    m.video.setFocus(true)
end sub 

function onKeyEvent(key as String, press as Boolean) as Boolean
    ?":D homeView :: onKeyEvent ";key;" - press: ";press 
    handled = false
    if press then
        if (key = "back") then
            if(m.video.isInFocusChain())
                m.video.control = "pause"
                m.video.visible = false
                m.rowList.setFocus(true)
                handled = true
            end if
        end if
        
    end if

    return handled
end function
