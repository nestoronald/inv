{extends file='tpl/base.tpl'}
    {block name=cabecera}
      {if $details!=-100}
          <div class="row-fluid"><h2 class="title-profile">{$details.empleado_name}</h2></div>
      {/if}
    {/block}
    {block name=contenido}
    {if $details!=-100}

    <div class="profile">
      <div class="art span9">
        <div class="menu-perfil span12">
          <div class="span5">
              {assign var=url value="http://www.igp.gob.pe/capacidades_igp/img/fotos/{$details.empleado_dni}.jpg" scope="global"}
              <img class="perfil fleft" src="{$url}" alt="">
          </div>
          <div class="span7">
              <h4>Datos personales</h4>
              <div class="igp-block">
                <p>Web personal:  <a href="#" target="_blank">$web personals</a></p>
                <p>Pais de Nacimiento:  { $details.pais_nacimiento }</p>
                <h5>Residencia</h5>
                <p> <span class="igp-panel-box">Pais: </span> { $details.pais }</p>
                <p> <span class="igp-panel-box">Región: </span> { $details.region }</p>
                <p> <span class="igp-panel-box">Provincia: </span> { $details.provincia }</p>
                <p> <span class="igp-panel-box">Distrito:</span>  { $details.distrito }</p>
              </div>
          </div>

        </div>
        <div class="clear"></div>
        <div class="span12">
            <div class="tab-igp">
            <ul class="nav nav-sidebar nav-list">
              <li class="active"> <a href="#midescripcion">Mi descripción</a></li>
              <li><a href="#datos-academicos">Datos Académicos</a></li>
              <li><a href="#idiomas">Idiomas</a></li>
              <li><a href="#proyectos-investigacion">Proyectos de Investigacion</a></li>
              <li><a href="#producción-cientifica">Producción Cientifica</a></li>
            </ul>
            </div>

          <div class="line-h" id="midescripcion">
            <p>
                <span class="igp-panel-box">Resume </span>: { $details.resumen }
            </p>
          </div>
          <div class="line-h" id="datos-academicos">
            <h4>Datos Académicos</h4>
            <div class="igp-block">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                  <th>Grado</th>
                  <th>Titulo</th>
                  <th>Centro de Estudios</th>
                  <th>País de estudios</th>
                  <th>Fecha de Inicio</th>
                  <th>Fecha finalizó</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
          <div class="line-h" id="idiomas">
            <h4>Idiomas</h4>
            <div class="igp-block">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                  <th>Idioma</th>
                  <th>Letra</th>
                  <th>Conservación</th>
                  <th>Escritura</th>
                  <th>Lengua Materna</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
          <div class="line-h" id="proyectos-investigacion">
            <h4>Proyectos de Investigación</h4>
            <div class="igp-block">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                  <th>Titulo</th>
                  <th>Descripción</th>
                  <th>Fecha de Inicio</th>
                  <th>Fecha Fin</th>
                  <th>Inv. Principal</th>
                  <th>Area OCDE</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
          <div class="line-h" id="producción-cientifica">
            <h4>Producción Cientifica</h4>
            <div class="igp-block">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                  <th>Tipo de Producción</th>
                  <th>Título</th>
                  <th>Fecha de Producción</th>
                  <th>Palabras clave</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="span3 sidebar">
        <div class="box-igp-1">
          <h4>Mis Publicaciones</h4>
          <ul>
            <li><a href="#">Climate change and Mediterranean seagrass meadows</a></li>
            <li><a href="#">Prospeccions de gas i petroli a les Balears</a></li>
            <li><a href="#">Què aporta la genètica a l’estudi de les espècies marines invasores a Europa?</a></li>
          </ul>

        </div>
        <div class="box-igp-1">
          <h4>Mi Blog</h4>
          <ul>
            <li><a href="#">La genètica a l’estudi de les espècies marines invasores a Europa?</a></li>
            <li><a href="#">Climate change and Mediterranean seagrass meadows</a></li>
            <li><a href="#">Prospeccions de gas i petroli a les Balears</a></li>

          </ul>
        </div>
      </div>
      <hr />
    </div>
    {else}
      <div class="error">El investigador no existe</div>
    {/if}

    {/block}