<?php
session_start();
/** $conn = new \mysqli('localhost', 'root', '2208', 'ejercicio3');**/
define('BD_HOST', 'localhost');
define('BD_NAME', 'ejercicio3');
define('BD_USER', 'root');
define('BD_PASS', '2208');
/*** Configuración del soporte de UTF-8, localización (idioma y país)*/
ini_set('default_charset', 'UTF-8');
setLocale(LC_ALL, 'es_ES.UTF.8');
date_default_timezone_set('Europe/Madrid');




spl_autoload_register(function ($class) {

    // project-specific namespace prefix
    $prefix = 'es\\fdi\\ucm\\aw\\';

    // base directory for the namespace prefix
    $base_dir = __DIR__ . '/';

    // does the class use the namespace prefix?
    $len = strlen($prefix);
    if (strncmp($prefix, $class, $len) !== 0) {
        // no, move to the next registered autoloader
        return;
    }
    // get the relative class name
    $relative_class = substr($class, $len);

    /** replace the namespace prefix with the base directory, replace namespace
     separators with directory separators in the relative class name, append
    with .php **/
    $file = $base_dir . str_replace('\\', '/', $relative_class) . '.php';
    // if the file exists, require it
    if (file_exists($file)) {
        require $file;
    }
});

$app= \es\fdi\ucm\aw\Aplicacion::getSingleton();
$app->init(array('host'=>BD_HOST, 'bd'=>BD_NAME, 'user'=>BD_USER, 'pass'=>BD_PASS));

register_shutdown_function(array($app, 'apagar'));
?>