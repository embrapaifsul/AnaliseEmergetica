function passo1(){
    if (document.Passo1.areapecuaria.value===""){
        
        alert ("Por Favor, Preencha todos os campos");

        return false;
    }
        
    else{
        return true;  
    }
}
function passo2 (){
    if (document.formulario1.login.value==="" || 
        document.formulario1.email.value==="" || 
        document.formulario1.senha.value==="" || 
        document.formulario1.finan.value==="selecione"){
    
        alert ("Por Favor, Preencha todos os campos");

        return false;
    }
        
    else{
        return true;  
    }    
}
function passo3 (){
    if (document.Passo3.bovinos.value===""){
    
        alert ("Por Favor, Preencha todos os campos");

        return false;
    }       
    else{
        return true;  
    }    
}
function passo4 (){
    if (document.Passo4.medicamentos.value==="" || 
        document.Passo4.maodeobra.value==="" ||
        document.Passo4.maquinas.value==="" ||
        document.Passo4.dispesas.value===""){
    
        alert ("Por Favor, Preencha todos os campos");

        return false;
    }       
    else{
        return true;  
    }    
}


function Cadastro2(){
    if(document.formulario2.login.value==="" ||
       document.formulario2.email.value==="" ||
       document.formulario2.senha.value==="" ||
       document.formulario2.confsenha.value===""){
    
        alert ("Por Favor, Preencha todos os campos");

        return false;
    } 
    else if(document.formulario2.senha.value !==
            document.formulario2.confsenha.value){
    
        alert ("Senha Incompativeis");

        return false;
    }
    else{
        return true;  
    }  
}




