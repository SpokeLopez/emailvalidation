<?php

class EmailValidationSellerauthModuleFrontController extends ModuleFrontController
{
    public function init()
    {
        parent::init();

        // Si el usuario ya está logueado, redirigir a la solicitud de creador
        if ($this->context->customer->isLogged()) {
            $redirectUrl = $this->context->link->getModuleLink('ets_marketplace', 'registration');
            Tools::redirect($redirectUrl);
            exit;
        }

        // Verificar si necesitamos redirigir a formularios nativos
        $email = Tools::getValue('email');
        $action = Tools::getValue('action');
        $createAccount = Tools::getValue('create_account');
        if ($email && $action == 'login') {
            // Redirigir al login nativo con email prellenado
            $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                'email' => $email,
                'back' => $this->context->link->getModuleLink('ets_marketplace', 'registration'),
                'seller_login' => '1'
            ));
            Tools::redirect($redirectUrl);
            exit;
        }
        if ($email && $createAccount) {
            // Redirigir al registro nativo con email prellenado
            $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                'create_account' => '1',
                'email' => $email,
                'back' => $this->context->link->getModuleLink('ets_marketplace', 'registration'),
                'seller_register' => '1'
            ));
            Tools::redirect($redirectUrl);
            exit;
        }
        $this->setTemplate('module:emailvalidation/views/templates/front/sellerauth.tpl');
    }

    public function initContent()
    {
        parent::initContent();
    }

    public function getBreadcrumbLinks()
    {
        $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = [
            'title' => $this->l('Registro de Creador'),
            'url' => $this->context->link->getModuleLink('emailvalidation', 'sellerauth')
        ];
        return $breadcrumb;
    }

    public function getTemplateVarPage()
    {
        $page = parent::getTemplateVarPage();
        $page['meta']['title'] = $this->l('Registro de Creador');
        $page['meta']['description'] = $this->l('Valida tu email para registrarte como vendedor');
        $page['body_classes']['page-seller-auth'] = true;
        return $page;
    }
    public function setMedia()
    {
        parent::setMedia();

        $this->registerStylesheet(
            'module-emailvalidation-style',
            'modules/emailvalidation/views/css/style.css',
            ['media' => 'all', 'priority' => 150]
        );
    }
}
