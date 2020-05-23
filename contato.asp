<%

'CODIFICAÇÃO DO ARQUIVO'
Session.LCID = 1046
Session.CodePage = 65001
Response.CharSet = "UTF-8"

'REQUISITA DADOS DO FORMULARIO'
nome = request.form("nome")
email = request.form("email")
telefone = request.form("telefone")
mensagem = request.form("mensagem")

'************************ CORPO DO EMAIL

nomedoformulario = "Formulario de Contato"

corpo = "<html><head><style>p{font-size:16px;color: #3e3e3e;}</style></head><body><h1>" & nomedoformuario &
corpo = corpo & "<p><b>ENVIADO DIA: " & date() & "ÁS" & time() & "</b></p><BR>"
corpo = corpo & "<p><b>NOME:</b> " & nome" "</p>"
corpo = corpo & "<p><b>EMAIL:</b> <a href='mailto:" & email & "'>" & email & "</a></p>"
corpo = corpo & "<p><b>TELEFONE:</b>" & telefone & "</p>"
corpo = corpo & "<p><b>MENSAGEM:</b>" & replace(mensagem,chr(10),"<br>") & "</p>"
corpo = corpo & "</body></html>" 


'**********************ENVIA O EMAIL

if request.servervariables("server_name")<> "localhost" then

set mail = server.createobject("persits.mailsender")
mail.Port = 587
mail.host      = "smtp.servidor.com.br"
mail.username  = "email@servidor.com.br"
mail.password  = ''''''
mail.subject   = nomedoformulario & " - " & nome
mail.AddCC     = "crisano79@gmail.com"
mail.from      = "email@servidor.com.br"
mail.AddReplyTo email
mail.fromname  = nome
mail.body      = corpo
mail.ishtml    = true

mail.send
set mail = nothing

end if

response.redirect Request.ServerVariables("HTTP_REFERER") & "?nome=" & nome 

%>