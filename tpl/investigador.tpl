{extends file='tpl/base.tpl'}
    {block name=cabecera}
      {if $details!=-100}
          <div class="row-fluid"><h2 class="title-profile">{$details.empleado_name}, {$details.empleado_surname}</h2> </div>
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
                <p>Web personal:  <a href="#" target="_blank">www.igp.gob.pe/investigadores/{$details.correo_igp}</a></p>
                <p>Pais de Nacimiento: {$details.pais_nacimiento}   </p>
                <h5>Residencia</h5>
                <p> <span class="igp-panel-box">Pais: </span> Peru</p>
                <p> <span class="igp-panel-box">Región: </span>Lima</p>
                <p> <span class="igp-panel-box">Provincia: </span>Lima</p>
                <p> <span class="igp-panel-box">Distrito:</span>{$details.distrito_residencia} </p>
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
              <!-- <li><a href="#proyectos-investigacion">Proyectos de Investigacion</a></li> -->
              <li><a href="#producción-cientifica">Producción Cientifica</a></li>
            </ul>
            </div>

          <div class="line-h" id="midescripcion">
            <p>
                <span class="igp-panel-box">Resumen </span>:
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur, a, deserunt, aliquid ratione optio similique maiores debitis blanditiis molestias id aut repudiandae assumenda molestiae ab laboriosam culpa quis est eaque.
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, eligendi, quibusdam, labore culpa dolorum dolores amet iste dignissimos corrupti repellendus repudiandae a necessitatibus ex. Quia voluptatem dolorum eligendi placeat accusamus!.</p>
                <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, tempore, temporibus libero nesciunt tenetur sequi ratione velit iste accusamus quas unde numquam vel ea provident ducimus deleniti exercitationem labore nemo!</p>
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
                  <!-- <th>País de estudios</th> -->
                  <th>Fecha de Inicio</th>
                  <th>Fecha finalizó</th>
                  </tr>
                </thead>
                <tbody>
                  {section name=sec1 loop=$details.academic}
                  <tr>
                    <td>{$details.academic[sec1].grado}</td>
                    <td>{$details.academic[sec1].titulo}</td>
                    <td>{$details.academic[sec1].centro_estudios}</td>
                    <!-- <td>-</td> -->
                    <td>{$details.academic[sec1].mes_ini}/{$details.academic[sec1].ano_ini}</td>
                    <td>{$details.academic[sec1].mes_fin}/{$details.academic[sec1].ano_fin}</td>
                  </tr>
                  {/section}
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
                  <th>Lectura</th>
                  <th>Conservación</th>
                  <th>Escritura</th>
                  <!-- <th>Lengua Materna</th> -->
                  </tr>
                </thead>
                <tbody>
                  {section name=sec1 loop=$details.languaje}
                  <tr>
                    <td>{$details.languaje[sec1].idioma}</td>
                    <td>{$details.languaje[sec1].leido_actual}</td>
                    <td>{$details.languaje[sec1].escrito_actual}</td>
                    <td>{$details.languaje[sec1].hablado_actual}</td>
                    <!-- <td> </td> -->
                  </tr>
                  {/section}
                </tbody>
              </table>
            </div>
          </div>
          <!-- <div class="line-h" id="proyectos-investigacion">
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
          </div> -->
          <div class="line-h" id="producción-cientifica">
            <h4>Producción Cientifica</h4>
            <div class="igp-block">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                  <th>Tipo de Producción</th>
                  <th>Título</th>
                  <th>Fecha de Producción</th>
                  </tr>
                </thead>
                <tbody>
                  {section name=sec1 loop=$details.publication}
                  <tr>
                    <td>{$details.publication[sec1].subcategory_description}</td>
                    <td>{$details.publication[sec1].titulo}</td>
                    <td>{$details.publication[sec1].month_pub}/{$details.publication[sec1].year_pub}</td>

                  </tr>
                  {/section}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="span3 sidebar">
        <div class="box-igp-1">
          <h4>Ultimas Publicaciones</h4>
          <ul>

            {if $details.publication }
            {assign var=url value="http://www.igp.gob.pe/its/index.php?idfrom=3&idautor={$details.publication.0.idautor}&iddata=" scope="global"}
            {for $foo=0 to 2}
                {assign var=data value="{$details.publication.{$foo}.iddata}&pag=2" }
                <li><a target="_blank" href="{$url}{$data}">{$details.publication.{$foo}.titulo}
                    <span>{$details.publication.{$foo}.fx_produccion}</span></a>
                </li>
            {/for}
            {/if}
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
