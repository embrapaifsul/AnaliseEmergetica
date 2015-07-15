<%-- 
    Document   : mostraesconde
    Created on : 05/05/2015, 14:17:19
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function exibe()
            {
                var texto = document.getElementById("texto");
                if(texto.style.display == "none")
                    texto.style.display = "block";
                else
                    texto.style.display = "none";
            }
            
        </script>
    </head>
    
    <body>
        <h1 id="texto" style="display: none">Hello World!</h1>
        
        <input type="button" id="ok" onclick="exibe()"/>
        
    </body>
</html>
