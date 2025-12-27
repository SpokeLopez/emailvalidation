<?php

class EmailValidationSellerModuleFrontController extends ModuleFrontController
{
    public function init()
    {
        parent::init();
        $this->setTemplate('module:emailvalidation/views/templates/front/seller.tpl');
    }

    public function initContent()
    {
        parent::initContent();
    }

    public function getBreadcrumbLinks()
    {
        $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = [
            'title' => $this->l('Quiero Vender'),
            'url' => $this->context->link->getModuleLink('emailvalidation', 'seller')
        ];
        return $breadcrumb;
    }

    public function getTemplateVarPage()
    {
        $page = parent::getTemplateVarPage();
        $page['meta']['title'] = $this->l('Quiero Vender');
        $page['meta']['description'] = $this->l('Únete a nuestra red de vendedores y aumenta tus ingresos');
        $page['body_classes']['page-seller'] = true;
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
