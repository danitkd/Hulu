sub init()
    m.baseUrl = "http://192.168.1.19:8080/"
    m.top.functionName = "requestInformation"

    m.top.user = m.text  'lo que me ponen en el email
    m.top.code = m.title 'lo que me ponen en el password 
end sub

sub requestInformation()
    request = CreateObject("roUrlTransfer")  
    request.AddHeader("user","code") 
    ?"         "
    ?"✌we're in the task!!!✌"
end sub

function GetToString() as String

end function