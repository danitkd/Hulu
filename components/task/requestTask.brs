sub init()
    m.baseUrl = "http://192.168.0.6:8080/"
    m.top.functionName = "requestInformation"
end sub

sub requestInformation()
    headers = {
        user: m.top.user,
        password: m.top.password 
    }
    response = getResponse(m.baseUrl, headers)
    m.top.output = response.apiToken 
    ?"✌we're in the task!!!✌";response
end sub

sub requests() 'como sé que la FN se va para aquí?
    header = {}
    header["X-API-TOKEN"] = m.top.token
    '{ "X-API-TOKEN": m.top.token }
    moviesResponse =  getResponse(m.baseUrl + "vod?filter=movie", header) 
    seriesResponse =  getResponse(m.baseUrl + "vod?filter=series", header) 
    ?"TOKEN REQUEST MOVIES"; m.top.token
    createContent(moviesResponse, seriesResponse)
end sub 

function getResponse(url as String, headers = invalid)
    request = CreateObject("roUrlTransfer")
    'request.AddHeader("X-API-TOKEN", m.top.token) 'X-API-TOKEN es porque así esta en la API 
    
    if headers <> invalid then
        for each item in headers.Items()
            request.AddHeader(item.key, item.value)
            print "🧐" + item.key + " - " + item.value
        end for
    end if
    
    request.setUrl(url)
    body = request.getToString()
    response = parseJson(body)

    return response
end function

sub createContent(moviesResponse, seriesResponse)
    content = createObject("RoSGNode", "ContentNode")
    sectionMovies = content.createChild("ContentNode")
    sectionMovies.title = "MOVIES"

    for i = 0 to moviesResponse.count() - 1
        movie = moviesResponse[i]
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

    sectionSeries = content.createChild("ContentNode")
    sectionSeries.title = "SERIES"

    for i = 0 to seriesResponse.count() - 1
        serie = seriesResponse[i]
        itemCN = sectionSeries.createChild("ContentNode")
        itemCN.id = serie.id
        itemCN.title = serie.title 
        itemCN.contentType = serie.type
        itemCN.description = serie.description
        itemCN.HDPosterUrl = serie.poster 

        if serie.poster = invalid then 
            itemCN.HDPosterUrl = "pkg:/images/rey2.png"
        end if 
        
    end for 

    m.top.outputNode = content
end sub 


