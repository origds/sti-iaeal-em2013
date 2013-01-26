//Funcion que quita los indicadores de Usuario y contraseña del input
function llenarInput(elem){
    elem.setAttribute("value","");
    elem.setAttribute("style","color:#000000 !important");
    if (elem.name == "contrasenaLogin" ){
        elem.setAttribute("type","password");  
    }
}
//Funcion que pone los indicadores de usuario y contraseña si no se ha puesto nada
function volverValor(elem){ 
    if (elem.name == "usuario")
        if (elem.value == ""){
            elem.setAttribute("value","Usuario");
            elem.setAttribute("style","color:#A6A6B8");  
        }
        else if (elem.name == "contrasena")              
            if (elem.value == "")
            {
                elem.setAttribute("type","text");
                elem.setAttribute("value","Contraseña");    
                elem.setAttribute("style","color:#A6A6B8");  
           
            }		
}


