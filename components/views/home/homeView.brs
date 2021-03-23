sub init()
    'm.rowlist = m.top.findNode("rowlist")
    'focusRowlist()
    crateTask()
end sub

'sub focusRowlist()
    'm.rowList.setFocus(true)
'end sub

sub crateTask()
    ?"working in the task"
    m.moviesTask = CreateObject("roSGNode", "LogInTask")
    m.moviesTask.observeField("output", "onMoviesReceived")
    m.moviesTask.functionName = "requestMovies"
    m.moviesTask.control = "RUN"
end sub 

sub onMoviesReceived()
    ?"onMoviesReceived()";m.moviesTask.output   
    m.moviesTask.control = "STOP"
    m.moviesTask.unobserveField("output")
    m.moviesTask = invalid
end sub
