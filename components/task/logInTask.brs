sub init()
    m.baseUrl = "http://192.168.0.7:8080/"
    m.moviesUrl ="http://192.168.0.7:8080/vod?filter=movie"
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
    ?"✌we're in the task!!!✌";respose
end sub

sub requestMovies()
    movies = CreateObject("roUrlTransfer")
    movies.AddHeader("token",m.global.token)
    movies.setUrl(m.moviesUrl)
    moviesBody = movies.getToString()
    responseMovies = parseJson(moviesBody)
    m.top.output = moviesBody

    ?"         "
    ?"📹📹 MOVIES IN THE TASK";responseMovies
end sub 