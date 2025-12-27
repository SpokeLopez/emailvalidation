<?php

class EmailValidationCheckModuleFrontController extends ModuleFrontController
{
    public function postProcess()
    {
        if (Tools::isSubmit('email')) {

            $email = Tools::getValue('email');
            $sellerMode = Tools::getValue('seller_mode', 0);
            $customer = new Customer();
            $customer->getByEmail($email);

            if ($customer->id) {
                if ($sellerMode) {
                    // Verificar en tabla ps_ets_mp_seller si ya es creador
                    $sellerId = Db::getInstance()->getValue('
                        SELECT id_seller
                        FROM ' . _DB_PREFIX_ . 'ets_mp_seller
                        WHERE id_customer = ' . (int)$customer->id . '
                        AND active = 1
                    ');

                    if ($sellerId) {
                        // Ya es vendedor activo
                        $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                            'email' => $email,
                            'back' => urlencode($this->context->link->getModuleLink('ets_marketplace', 'dashboard')),
                            'seller_active' => '1'
                        ));
                        Tools::redirect($redirectUrl);
                        exit;
                    } else {
                        // Cliente existe pero no es creador
                        $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                            'email' => $email,
                            'back' => urlencode($this->context->link->getModuleLink('ets_marketplace', 'registration')),
                            'seller_pending' => '1'
                        ));
                        Tools::redirect($redirectUrl);
                        exit;
                    }
                } else {
                    // Cliente normal
                    $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                        'email' => $email,
                        'back' => 'my-account'
                    ));
                    Tools::redirect($redirectUrl);
                    exit;
                }
            } else {
                if ($sellerMode) {
                    if (session_status() == PHP_SESSION_NONE) {
                        session_start();
                    }
                    $_SESSION['email_validation_seller_mode'] = true;
                    $_SESSION['pending_seller_registration'] = true;

                    $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                        'create_account' => '1',
                        'email' => $email,
                        'back' => urlencode($this->context->link->getModuleLink('ets_marketplace', 'registration')),
                        'seller_register' => '1'
                    ));
                    Tools::redirect($redirectUrl);
                    exit;
                } else {
                    $redirectUrl = $this->context->link->getPageLink('authentication', true, null, array(
                        'create_account' => '1',
                        'email' => $email
                    ));
                    Tools::redirect($redirectUrl);
                    exit;
                }
            }
        } else {
            // No se envió email - mostrar error
            $this->errors[] = $this->l('Please provide an email address');
        }
    }

    public function initContent()
    {
        parent::initContent();

        $this->context->smarty->assign([
            'errors' => $this->errors
        ]);

        $this->setTemplate('module:emailvalidation/views/templates/front/check.tpl');
    }
}
