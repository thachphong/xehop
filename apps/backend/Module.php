<?php

namespace Multiple\Backend;

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Dispatcher;
use Phalcon\DiInterface;
use Phalcon\Db\Adapter\Pdo\Mysql as Database;
use Phalcon\Mvc\View\Engine\Volt ;

class Module
{

	public function registerAutoloaders()
	{

		$loader = new Loader();

		$loader->registerNamespaces(array(
			'Multiple\Backend\Controllers' => '../apps/backend/controllers/',
			'Multiple\Models'      => '../apps/models/',
            'Multiple\Library'      => '../apps/library/',
			'Multiple\Backend\Plugins'     => '../apps/backend/plugins/',
			'Multiple\PHOClass'      => '../apps/phoclass/',
		));
        /*$loader->registerDirs(
			array(
				'../apps/library/',				
			)
		)->register();*/

		$loader->register();
	}

	/**
	 * Register the services here to make them general or register in the ModuleDefinition to make them module-specific
	 */
	public function registerServices(DiInterface $di)
	{

		//Registering a dispatcher
		$di->set('dispatcher', function() {
			$dispatcher = new Dispatcher();
			$dispatcher->setDefaultNamespace("Multiple\Backend\Controllers\\");
			return $dispatcher;
		});

		//Registering the view component
		$di->set('view', function() {
			$view = new View();
			$view->setViewsDir('../apps/backend/views/');
           // $view->setTemplateBefore('main');

            $view->registerEngines([
                ".volt" => function($view, $di) {

                    $volt = new Volt($view, $di);

                    $volt->setOptions([
                        'compiledPath' => function ($templatePath) {
                            return realpath(__DIR__."/../../var/volt") . '/' . md5($templatePath) . '.php';
                        },
                        'compiledExtension' => '.php',
                        'compiledSeparator' => '%'
                    ]);

                    return $volt;
                }
            ]);

            return $view;
			//return $view;
		});

		//Set a different connection in each module
		/*$di->set('db', function() {
			return new Database(array(
				"host" => "localhost",
				"username" => "root",
				"password" => "",
				"dbname" => "multiple"
			));
		});*/
	}
}
