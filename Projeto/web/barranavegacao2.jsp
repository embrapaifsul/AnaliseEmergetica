<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="navbar-inner">
        <div class="container">
            <!-- .btn-navbar est� classe � usada como alternador para o conteudo coplapsavel-->
            <button class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand">Fazenda</a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a href="InicioPropriedade.jsp">Usuario: <%=u.getLogin()%></a></li>
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a>Nivel: 2</a></li>
                </ul>
            </div>
            <form action="index.jsp" class="navbar-form pull-right">
                <button class="btn btn-inverse"> Sair </button>
            </form>
        </div>
    </div>
</nav>

<header class="page-header"></header>
