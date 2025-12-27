{extends file='page.tpl'}

{block name='page_title'}
  {l s='Quiero Vender' d='Modules.Emailvalidation.Shop'}
{/block}

{block name='page_content'}

  <section>
    <div class="banner-vender">
      <img src="modules/emailvalidation/views/img/iso-logo.svg" class="iso-logo" title="isologo hamo">
      <h1 class="titulo">¡Empieza a vender!</h1>
      <p class="parrafo"><b style="font-family: Poppins-Medium">En HAMO.MX creamos el primer marketplace hecho para creadores y artesanos mexicanos. </b> Una plataforma sencilla, rápida y segura donde puedes vender tus piezas sin complicarte con páginas web o intermediarios.</p>
      {* <a href="#seccion-tienda"> <p class="conoce-mas">CONOCE MÁS</p></a> *}
      <a href="#" class="conoce-mas" onclick="document.querySelector('#seccion-tienda').scrollIntoView({ behavior: 'smooth' }); return false;"><p class="conoce-mas">CONOCE MÁS</p></a>
      <img src="modules/emailvalidation/views/img/down.svg" class="iso-logo" title="isologo hamo">
    </div>
  </section>

  <section>
    <div class="banner-hamo">
      <h1 id="seccion-tienda" class="titulo-2">¿Por qué <span class="tipo-1"> abrir tu <br>tienda</span> en HAMO?</h1>
      <img src="modules/emailvalidation/views/img/capa.svg" class="capa" title="isologo hamo">

      <p class="parrafo-one">Comparte tu talento con un público<br> que valora lo hecho con alma.</p>

    <div class="container">
    <div class="espacio-caja">
      <div class="row">
        <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">01</p>
            <p class="sub-titulo">Plataforma<br> especializada</p>
            <p class="parra-c poppins-font">Pensando en las necesidades de los creadores y artesanos mexicanos.</p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">02</p>
            <p class="sub-titulo">Gestión fácil y <br> automatizada</p>
            <p class="parra-c poppins-font">Administra tu tienda desde casa; HAMO.MX gestiona productos, ventas y pagos por ti.</p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">03</p>
            <p class="sub-titulo">Sin comisiones<br> ocultas</p>
            <p class="parra-c poppins-font">Transparencia total, sin sorpresas.</p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">04</p>
            <p class="sub-titulo">Soporte<br> personalizado</p>
            <p class="parra-c poppins-font">Nuestro equipo está a tu disposición para ayudarte en cualquier momento.</p>
          </div>
        </div>

         <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">05</p>
            <p class="sub-titulo">Marketing<br> integrado</p>
            <p class="parra-c poppins-font">Te beneficiarás de nuestras estrategias de marketing y redes sociales para aumentar tu visibilidad y alcance.</p>
          </div>
        </div>

         <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">06</p>
            <p class="sub-titulo">Envíos y cálculo<br> automático</p>
            <p class="parra-c poppins-font">Facilitamos tus envíos  con variedad de paqueterías disponibles y calculamos el costo automáticamente.</p>
          </div>
        </div>

         <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">07</p>
            <p class="sub-titulo">Flexibilidad <br>total</p>
            <p class="parra-c poppins-font">No necesitas tener un stock grande, puedes comenzar con pocos productos e ir aumentando tu catálogo. </p>
          </div>
        </div>

         <div class="col-md-3">
          <div class="bg-c">
            <p class="numb">08</p>
            <p class="sub-titulo">Publica sin<br> restricciones</p>
            <p class="parra-c poppins-font">Puedes publicar la cantidad de productos que desees.</p>
          </div>
        </div>
      </div>
      </div>

    </div>

    </div>

  </section>

  <div class="seller-page-container">

    <div class="row">


      <div class="col-lg-12 col-md-10 mx-auto bg-vendedor"> 

        

        {* Formulario simplificado - solo botón *}
        <div class="seller-cta-form bg-formulario">
          
        
        <div class="card-body">
        <p class="titulo-tienda">¡Abre tu <span class="italic">tienda</span> en <br> <span class="italic">línea</span> hoy!</p>
        <p class="parrafo-tienda">Crece tus ventas en línea de <br> manera fácil y rápida.</p>
             <div class="text-center">
              <a href="{$urls.base_url}index.php?fc=module&module=emailvalidation&controller=sellerauth"
                class="btn btn-lg px-5 btn-vender">
                {l s='Crea tu cuenta' d='Modules.Emailvalidation.Shop'}
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <section class="suscripcion-estandar">
   <p class="titulo-tienda"><b class="fst-italic">Únete</b> a Hamo</p>
   <p class="parrafo-tienda">Puedes cancelar tu membresía en cualquier momento.</p>

  <div class="card-suscripcion">
    <h2 class="card-suscripcion-poppins">Suscripción Estándar</h2>
    <p class="limitado">¡Sólo por tiempo limitado!</p>

    <div class="precio">
      <span class="precio-original">$299</span>
      <span class="precio-descuento">$99</span>
      <span class="por-mes">MXN/MES</span>
    </div>

    <button class="btn-suscribir" onclick="window.location.href='{$urls.base_url}index.php?fc=module&module=emailvalidation&controller=sellerauth'">Activar mi suscripción por $99</button>

    <ul class="beneficios">
      <li style="font-family: Poppins-Regular"><strong>✓ Ahorro de más del 65%</strong></li>
      <li style="font-family: Poppins-Regular">✓ Acceso completo a la plataforma.</li>
      <li style="font-family: Poppins-Regular">✓ Perfil de creador, gestión de productos y ventas.</li>
      <li style="font-family: Poppins-Regular">✓ Comisión estándar por transacción del 25%</li>
    </ul>

    <div class="badge-descuento">
      Aprovecha<br>ahora más del<br><strong> <span class="precio">65%</span><br>de descuento</strong>
    </div>
  </div>
</section>

<section class="bg-necesidades">



<h1 class="necesitas">¿Necesitas ayuda?</h1>
<p class="parrafo-necesita">Si tienes dudas para abrir tu tienda en línea contáctanos por <br>Whatsapp en un horario de <b>Lunes a Viernes de 10:00am a 6:00pm.</b>.</p>


<div class="text-center">
            <a href="#" class="btn px-5 btn-vender">
              <img src="modules/emailvalidation/views/img/wathsapp.svg" class="icon-wathsapp">
              Chatea con nosotros
            </a>
          </div>
</section>
{/block}