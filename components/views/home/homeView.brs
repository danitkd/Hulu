sub init()
    m.rowlist = m.top.findNode("rowlist")
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
    id = item.id 
    ?"😍";id
end sub


function setVideo() as void
        videoContent = createObject("RoSGNode", "ContentNode")
        videoContent.url = "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8"
        videoContent.title = "Test Video"
        videoContent.streamformat = "hls"

        m.video = m.top.findNode("video")
        m.video.content = videoContent
        m.video.control = "play"
end function 