sub init()
    m.baseUrl = "http://192.168.1.22:8080/"
    m.moviesUrl = "http://192.168.1.22:8080/vod?filter=movie"
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

sub requestMovies()
    moviesRequest = CreateObject("roUrlTransfer")
    ?"TOKEN REQUEST MOVIES"; m.global.token
    moviesRequest.AddHeader("X-API-TOKEN",m.global.token) 'X-API-TOKEN es porque así esta en la API 
    moviesRequest.setUrl(m.moviesUrl)
    moviesBody = moviesRequest.getToString()
    responseMovies = parseJson(moviesBody)
    'm.top.outputArray = responseMovies
    'aqui me voy a otra funcion a arma el CN es el content del rowlist
    
    ?"         "
    ?"📹📹 MOVIES IN THE TASK";responseMovies
end sub 

'aqui la func que hará el CN 
