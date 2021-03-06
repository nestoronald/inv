<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head>
<link href="./static/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Módulo Investigadores - IGP</title>
    <!--     Boostrap de twitter -->
    <link rel="stylesheet" href="./static/css/bootstrap.min.css">
    <link rel="stylesheet" href="./static/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="./static/css/style.css">
    {$xajax}

</head>
<body>
  <div id="form" name="form"></div>
    <div class = "container main-igp">
        <div id="header" class="cabecera">
            <div class="row-fluid">
                <div class="span4"><br>
                    <img src="./static/img/logo-minan-igp_2012.png"/>
                </div>
                <div class="span6"><h1 class="title-main fcenter"> Módulo de Investigadores  IGP</h1>
                </div>
                <div class="span2">
                    <img src="./static/img/igp-trans.png">
                </div>
            </div>
            <div class="container main-menu">
                    <div class="navbar igp-inverse">
                        <div class="navbar-inner">
                            <div class="navbar-header inline line">
                            <a class="navbar-brand inline fleft title" href="index.php"><h4>Investigadores</h4></a>
                            <form class="navbar-form inline" method="post" action="investigadores.php">
                                <input type="text" name="nombre" placeholder="Buscar Investigadores" class="form-control search-input span4">
                                <!-- <a class="btn search-btn" href="./investigadores.php"><i class="icon-search"></i></a> -->
                                <input type="submit" value="buscar" class="btn search-btn" />
                            </form>
                            </div>
                            <div class="nav-collapse collapse inline fright ">
                                <ul id="menu" class="nav"></ul>
                                <ul class="nav nav-pills pullright">
                                    <!-- <li><a href="/">Inicio</a></li>
                                    <li><a href="/investigadores">Investigadores</a></li> -->

                                    {if $smarty.session.iduser==1}
                                    <li id="login-igp"> <span class="realtive dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                <span id="m-perfil-img">
                                                <img src="/static/img/noavatar.jpg" alt="avatar-igp" /></span>
                                                <span id="m-perfil-username">{$smarty.session.username}</span>
                                                <b class="caret"></b>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li> <a href="/miperfil">Mi Perfil</a> </li>
                                                <li><a href="/editarPerfil">Editar Perfil</a></li>
                                                <li> <a href="logout.php">Cerra Sesión</a></li>
                                            </ul>
                                         </span>
                                     </li>
                                    {else}
                                    <!-- <li><a href="login.php"> Ingresar </a></li> -->
                                    {/if }
                                </ul>
                            </div>
                        </div>
                    </div>
            </div>
        </div>

        <div class="container">
            {block name=cabecera}

            {/block}
        </div>

          <div class="last container-fluid" id="contenido_inv">
                <div class="row-fluid">
                    {block name=contenido} {/block}
                </div>

          </div>
        <div class="container">
            <div class="row-fluid">
             <div class="contenedor-pie igp-inverse">
                <br>
                <p>Calle Badajoz # 169 - Mayorazgo IV Etapa - Ate Vitarte | Central Telefónica: 317-2300 |
                <a class="mostaza" href="#">Contacto </a>| Escríbenos a: <a rel="propover" class="mostaza" href="mailto:web@igp.gob.pe" >web@igp.gob.pe</a>
                </p><br>
             </div>
            </div>
        </div>
  </div>
<script type="text/javascript" src="./static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="./static/js/script-igp.js"></script>
<script src="./static/js/bootstrap.min.js"></script>
<!-- <script src="/static/js/bootstrap-collapse.js"></script>
<script src="/static/js/bootstrap-tooltip.js"></script> -->
<script src="./static/js/bootstrap-popover.js"></script>
<!-- <script src="/staticjs/typeahead.js"></script> -->
<!-- <script src="/static/js/modal.js"></script> -->
<!-- <script src="/static/js/bootstrap-scrollspy.js"></script> -->
</body>
</html>
