{extends file='page.tpl'}

{block name='page_title'}
  {l s='Validación de correo' d='Modules.Emailvalidation.Shop'}
{/block}

{block name='page_content'}
  {if $errors}
    <div class="alert alert-danger">
      {foreach from=$errors item=error}
        <p>{$error}</p>
      {/foreach}
    </div>

    <div class="text-center">
      <a href="{$urls.authentication}" class="btn btn-primary">
        {l s='Volver a intentar' d='Modules.Emailvalidation.Shop'}
      </a>
    </div>
  {else}
    <p>¡Email válido!</p>
  {/if}
{/block}
