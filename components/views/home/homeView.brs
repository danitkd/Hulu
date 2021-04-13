sub init()
    m.rowlist = m.top.findNode("rowlist")
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

