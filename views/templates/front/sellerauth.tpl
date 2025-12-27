{extends file='page.tpl'}

{block name='page_title'}
  {l s='Registro de Creador' d='Modules.Emailvalidation.Shop'}
{/block}

{block name='page_content'}
  {if isset($smarty.get.email) && isset($smarty.get.create_account)}
    {* Caso: Email no existe - Mostrar opción de registro *}
    <div class="register-form">
      <h2>{l s='Crear nueva cuenta de vendedor' d='Modules.Emailvalidation.Shop'}</h2>
      <p>{l s='Email verificado: ' d='Modules.Emailvalidation.Shop'}<strong>{$smarty.get.email}</strong></p>
      <p class="alert alert-info">
        {l s='Como este email no está registrado, procederemos a crear tu cuenta como vendedor.' d='Modules.Emailvalidation.Shop'}
      </p>
      <p class="alert alert-warning">
        {l s='Serás redirigido al registro. ' d='Modules.Emailvalidation.Shop'}
        <a href="{$urls.pages.register}?email={$smarty.get.email|escape:'url'}">
          {l s='Haz clic aquí para registrarte' d='Modules.Emailvalidation.Shop'}
        </a>
      </p>
    </div>

  {elseif isset($smarty.get.email) && isset($smarty.get.action) && $smarty.get.action == 'login'}
    {* Caso: Email existe - Mostrar opción de login *}
    <div class="login-form">
      <h2>{l s='Iniciar sesión para activar perfil de vendedor' d='Modules.Emailvalidation.Shop'}</h2>
      <p>{l s='Email: ' d='Modules.Emailvalidation.Shop'}<strong>{$smarty.get.email}</strong></p>
      <p class="alert alert-success">
        {l s='Tu cuenta existe. Inicia sesión para activar tu perfil de vendedor.' d='Modules.Emailvalidation.Shop'}</p>
      <p class="alert alert-warning">
        {l s='Serás redirigido al login. ' d='Modules.Emailvalidation.Shop'}
        <a href="{$urls.pages.authentication}?email={$smarty.get.email|escape:'url'}">
          {l s='Haz clic aquí para iniciar sesión' d='Modules.Emailvalidation.Shop'}
        </a>
      </p>
      <div class="mt-4 text-center">
        <p>
          {l s='Después de iniciar sesión, tu perfil de vendedor será activado automáticamente.' d='Modules.Emailvalidation.Shop'}
        </p>
      </div>
    </div>

  {else}
    {* Caso: Formulario inicial de validación de email *}
    <section class="bg-formulario">
      <div class="seller-validation-container">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-10 mx-auto">

              <h1 id="seccion-tienda" class="titulo-2"><span class="tipo-1"> Proceso de registro<br> para </span> Vendedores
              </h1>
              <img src="modules/emailvalidation/views/img/capa.svg" class="capa" title="isologo hamo">

              <p class="texto-1">Valida tu correo electrónico para continuar con el proceso de registro como vendedor</p>
              <p class="texto-1"><b>Ingresa tu correo electrónico</b></p>
              <p class="texto-1">Te ayudamos a determinar si necesitas crear una cuenta o activar tu perfil de vendedor</p>


              <div class="seller-email-validation">
                <div class="card-body">


                  <form action="{$urls.base_url}index.php" method="post" class="seller-email-check-form">
                    <input type="hidden" name="fc" value="module">
                    <input type="hidden" name="module" value="emailvalidation">
                    <input type="hidden" name="controller" value="check">
                    <input type="hidden" name="seller_mode" value="1">

                    <div class="form-group">
                      <label for="seller_email" class="form-label correoel">
                        {l s='Correo electrónico' d='Modules.Emailvalidation.Shop'}
                      </label>
                      <div class="input-icon-wrapper">
                        <span class="input-icon">
                          <img src="/modules/emailvalidation/views/img/input-email.svg" alt="Email" />
                        </span>
                        <input type="email" name="email" id="seller_email" class="form-control form-control-lg"
                          placeholder="{l s='ejemplo@correo.com' d='Modules.Emailvalidation.Shop'}" required>
                      </div>
                    </div>

                    <div class="form-group text-center">
                      <button type="submit" class="btn btn-primary btn-lg px-5">
                        {l s='Validar Email' d='Modules.Emailvalidation.Shop'}
                      </button>
                    </div>
                  </form>
                </div>
              </div>

              <div class="bg-beige">
                <p class="txt-despues">¿Qué sigue después?</p>
                <div class="row miclas">

                  <div class="col-md-6 bg-1">
                    <p class="parrafo"><b>Si ya tienes una cuenta</b></p>
                    <p class="parrafo">Te llevamos al login y activamos tu perfil de creador</p>
                  </div>
                  <div class="col-md-6 bg-1">
                    <p class="parrafo"><b>Si no tienes una cuenta</b></p>
                    <p class="parrafo">Te llevaremos al formulario para crear tu cuenta</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  {/if}

  <style>

    .card-body{
      max-width: 700px;
      margin: 0 auto;
    }
    form.seller-email-check-form {
      margin-top: 3em;
    }

    .col-md-6.bg-1 {
      background: #D7CCB8;
      border-radius: 20px;
      padding: 20px;
      margin: 12px !important;
      display: block;
      margin-left: 15px !important;
      padding-bottom: 3em;
    }

    .row.miclas {
      display: flex;
      justify-content: center;
    }

    p.parrafo {
      width: 100%;
      margin: 0 auto;
      font-family: Poppins-Light !important;
      color: #680333;
      font-size: 16px;
      padding-top: 15px;
      padding-bottom: 0px;
      text-align: left;
    }

    p.texto-1, p.texto-1 b{
      font-family: 'Poppins-Regular', sans-serif;
      font-weight: 400;
    }

    p.txt-despues {
      color: #680434;
      font-size: 2rem;
      padding-top: 1.5rem;
    }

    .bg-beige {
      background: #E0D8CB;
      height: auto;
      border-radius: 30px;
      padding: 30px 15px;
      margin-top: 3em;
    }

    /* Estilos para iconos en inputs */
    .input-icon-wrapper {
      position: relative;
    }

    .input-icon {
      position: absolute;
      left: 5px;
      top: 50%;
      transform: translateY(-50%);
      z-index: 10;
      pointer-events: none;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .input-icon img {
      width: 20px;
      height: 20px;
      opacity: 0.6;
      transition: opacity 0.3s ease;
    }

    .input-icon-wrapper .form-control {
      font-family: 'Poppins-Regular', sans-serif;
      font-size: 18px;
      height: 60px;
      border-radius: 5px;
      padding-left: 50px;
    }

  .btn-primary {
    margin-top: 30px;
    background-color: #CC096F;
    font-size: 18px;
    border-radius: 100px;
  }
  </style>
{/block}