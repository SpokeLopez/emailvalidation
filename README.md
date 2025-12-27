# 📧 Email Validation Module for PrestaShop

**Módulo de validación de correo electrónico con funcionalidades de registro para vendedores en PrestaShop 8.x**

[![PrestaShop](https://img.shields.io/badge/PrestaShop-8.x-FF6900.svg)](https://www.prestashop.com)
[![PHP](https://img.shields.io/badge/PHP-7.4+-777BB4.svg)](https://php.net/)
[![License](https://img.shields.io/badge/License-Proprietary-red.svg)]()

## 📝 Descripción

Este módulo de PrestaShop proporciona un sistema avanzado de validación de correos electrónicos antes del proceso de inicio de sesión/registro, con características especiales para vendedores del marketplace. Incluye una interfaz personalizada para promover el registro de nuevos vendedores y gestionar el proceso de autenticación de manera eficiente.

## ✨ Características

### 🔍 Validación de Email
- **Verificación de existencia**: Comprueba si el email ya está registrado en la base de datos
- **Redirección inteligente**: Dirige a los usuarios al formulario apropiado (login/registro)
- **Modo vendedor**: Funcionalidad especializada para registro de vendedores

### 🛒 Gestión de Vendedores
- **Landing page promocional**: Página atractiva para atraer nuevos vendedores
- **Verificación de estado**: Comprueba si un usuario ya es vendedor activo
- **Flujo de registro personalizado**: Proceso simplificado para vendedores
- **Integración con ETS Marketplace**: Compatible con el módulo de marketplace

### 🎨 Interfaz de Usuario
- **Diseño responsive**: Adaptado para dispositivos móviles y desktop
- **Estilo personalizado**: CSS integrado con tema cohesivo
- **Templates Smarty**: Plantillas reutilizables y mantenibles

## 🏗️ Estructura del Proyecto

```
emailvalidation/
├── config.xml                    # Configuración del módulo
├── config_mx.xml                # Configuración específica para México
├── emailvalidation.php          # Clase principal del módulo
├── index.php                    # Archivo de protección
├── controllers/
│   ├── front/
│   │   ├── check.php            # Controlador de validación
│   │   ├── seller.php           # Landing page vendedores
│   │   └── sellerauth.php       # Autenticación vendedores
│   └── index.php
├── views/
│   ├── css/
│   │   └── style.css           # Estilos del módulo
│   ├── img/                    # Recursos gráficos
│   └── templates/
│       └── front/
│           ├── check.tpl       # Template validación
│           ├── seller.tpl      # Template landing vendedores
│           └── sellerauth.tpl  # Template auth vendedores
```

## ⚙️ Instalación

### Requisitos
- PrestaShop 8.x
- PHP 7.4 o superior
- MySQL 5.7 o superior

### Pasos de instalación

1. **Descarga el módulo**
   ```bash
   git clone https://github.com/tu-usuario/emailvalidation.git
   ```

2. **Sube a PrestaShop**
   - Comprime la carpeta del módulo en ZIP
   - Ve a Back Office → Módulos → Subir módulo
   - Selecciona el archivo ZIP y sube

3. **Instala el módulo**
   - Busca "Email Validation" en la lista de módulos
   - Haz clic en "Instalar"
   - Configura el módulo según tus necesidades

## 🚀 Uso

### Validación de Email

El módulo intercepta el proceso de autenticación y proporciona:

```php
// Ejemplo de uso en el controlador check.php
$email = Tools::getValue('email');
$customer = new Customer();
$customer->getByEmail($email);

if ($customer->id) {
    // Usuario existe - redirigir a login
    Tools::redirect($loginUrl);
} else {
    // Usuario nuevo - redirigir a registro
    Tools::redirect($registerUrl);
}
```

### Modo Vendedor

Para activar el modo vendedor, el módulo:

1. Verifica si el usuario ya es vendedor activo
2. Redirige al dashboard si es vendedor
3. Ofrece registro como vendedor si no lo es

### URLs del Módulo

- **Landing vendedores**: `index.php?fc=module&module=emailvalidation&controller=seller`
- **Auth vendedores**: `index.php?fc=module&module=emailvalidation&controller=sellerauth`
- **Validación**: `index.php?fc=module&module=emailvalidation&controller=check`

## 🎯 Características Técnicas

### Hooks Registrados
- `actionCustomerAccountAdd`: Se ejecuta al crear nueva cuenta
- `actionAuthentication`: Se ejecuta en el proceso de autenticación
- `displayHeader`: Inyecta recursos en el header

### Base de Datos
El módulo consulta las siguientes tablas:
- `ps_customer`: Gestión de usuarios
- `ps_ets_mp_seller`: Verificación de vendedores (ETS Marketplace)

### Sesiones
Utiliza sesiones PHP para mantener estado:
```php
$_SESSION['email_validation_seller_mode'] = true;
$_SESSION['pending_seller_registration'] = true;
```

## 🎨 Personalización

### Estilos CSS
El archivo `views/css/style.css` contiene todos los estilos personalizados:
- Responsive design
- Tema cohesivo con colores corporativos
- Animaciones y transiciones suaves

### Templates Smarty
Las plantillas están ubicadas en `views/templates/front/`:
- Extensión del template base de PrestaShop
- Variables Smarty para contenido dinámico
- Integración con sistema de traducciones

## 🌐 Internacionalización

El módulo soporta múltiples idiomas:
- Español (configuración principal)
- Sistema de traducciones de PrestaShop
- Archivos de configuración localizados

```php
$this->l('Texto a traducir')
```

## 🔒 Seguridad

### Validaciones Implementadas
- Validación de email con `filter_var()`
- Sanitización de inputs con `Tools::getValue()`
- Verificación de tokens CSRF
- Escape de output en templates

### Protección de Archivos
Cada directorio incluye `index.php` con redirección para prevenir acceso directo:
```php
header("Location: ../");
exit;
```

## 📊 Configuración

### Panel de Administración
El módulo incluye un panel de configuración en el Back Office:
- Configuración básica del módulo
- Validación de inputs
- Almacenamiento en `ps_configuration`

## 🧪 Testing

### URLs de Prueba
1. **Landing vendedores**: Visita la página principal de vendedores
2. **Proceso de validación**: Prueba con emails existentes y nuevos
3. **Responsive**: Verifica en diferentes dispositivos

### Casos de Uso
- ✅ Email existente, usuario normal
- ✅ Email existente, vendedor activo
- ✅ Email existente, vendedor inactivo
- ✅ Email nuevo, registro normal
- ✅ Email nuevo, registro vendedor

## 🚀 Roadmap

### Funcionalidades Planeadas
- [ ] Integración con APIs de validación de email
- [ ] Estadísticas de conversión
- [ ] A/B Testing para landing pages
- [ ] Notificaciones automáticas
- [ ] Panel de analytics

### Mejoras Técnicas
- [ ] Optimización de consultas SQL
- [ ] Cache para verificaciones frecuentes
- [ ] Logs detallados de actividad
- [ ] API REST para integraciones

## 👥 Contribuir

### Proceso de Contribución
1. Fork del proyecto
2. Crea una rama feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit de cambios (`git commit -m 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

### Estándares de Código
- PSR-4 para namespaces
- Documentación en español
- Tests para nuevas funcionalidades
- Compatibilidad con PrestaShop 8.x

## 📚 Documentación Adicional

### Referencias Útiles
- [Documentación PrestaShop](https://devdocs.prestashop.com/)
- [ETS Marketplace](https://addons.prestashop.com/en/marketplace/6737-multivendor-marketplace.html)
- [Smarty Templates](https://www.smarty.net/docs/en/)

### Ejemplos de Código
Ver la carpeta `docs/examples/` para ejemplos detallados de uso.

## 🐛 Reportar Problemas

Si encuentras algún bug o tienes sugerencias:

1. Verifica que no esté ya reportado
2. Incluye información del entorno
3. Pasos para reproducir el problema
4. Comportamiento esperado vs actual

## 📄 Licencia

Este proyecto es de uso privado y propietario.

## ✉️ Contacto

**Eduardo López Barrientos**
- 📧 Email: [tu-email@ejemplo.com]
- 💼 LinkedIn: [tu-perfil-linkedin]
- 🐙 GitHub: [tu-usuario-github]

---

## 🏆 Créditos

Desarrollado por Eduardo López Barrientos para HAMO.MX
- Diseñado específicamente para marketplace de artesanos mexicanos
- Optimizado para PrestaShop 8.x
- Integrado con ETS Marketplace module

---

**⭐ Si este proyecto te resulta útil, considera darle una estrella en GitHub**

---

*Última actualización: Diciembre 2025*