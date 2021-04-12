sub init()
    m.baseUrl = "http://192.168.0.6:8080/"
    m.top.functionName = "requestInformation"
end sub

sub requestInformation()
    request = CreateObject("roUrlTransfer")  
    request.AddHeader("user", m.top.user) 
    request.AddHeader("password", m.top.password)
    request.setUrl(m.baseUrl)
    stringBody = request.getToString()
    response = parseJson(stringBody)
    m.top.output = response.apiToken 

    ?"         "
    ?"✌we're in the task!!!✌";response
end sub

sub requestMovies() 'como sé que la FN se va para aquí?
    moviesRequest = CreateObject("roUrlTransfer")
    ?"TOKEN REQUEST MOVIES"; m.top.token
    moviesRequest.AddHeader("X-API-TOKEN",m.top.token) 'X-API-TOKEN es porque así esta en la API 
    moviesRequest.setUrl(m.baseUrl + "vod?filter=movie")
    moviesBody = moviesRequest.getToString()
    responseMovies = parseJson(moviesBody)
    'm.top.outputArray = responseMovies
    createContent(responseMovies)
    
    ?"         "
    ?"📹📹 MOVIES IN THE TASK";responseMovies
end sub 


sub createContent(responseMovies)
    content = createObject("RoSGNode", "ContentNode")
    sectionMovies = content.createChild("ContentNode")
    sectionMovies.title = "MOVIES"

    for i=0 to responseMovies.count() - 1
        movie = responseMovies[i]
        itemCN = sectionMovies.createChild("ContentNode")
        itemCN.id = movie.id
        itemCN.title = movie.title 
        itemCN.contentType = movie.type
        itemCN.description = movie.description
        itemCN.HDPosterUrl = movie.poster 

        if movie.poster = invalid then 
            itemCN.HDPosterUrl = "pkg:/images/rey.png"
        end if 
        
    end for 

    m.top.outputNode = content
end sub 