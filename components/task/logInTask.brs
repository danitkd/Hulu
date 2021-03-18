sub init()
    m.baseUrl = "http://192.168.1.19:8080/"
    m.top.functionName = "requestInformation"
end sub

sub requestInformation()
    request = CreateObject("roUrlTransfer")  
    request.AddHeader("user", m.top.user) 
    request.AddHeader("password", m.top.password)
    request.setUrl(m.baseUrl)
    token = request.getToString()
    
    m.top.output = token 
    
    ?"         "
    ?"✌we're in the task!!!✌";token
end sub