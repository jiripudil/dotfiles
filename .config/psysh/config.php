<?php

declare(strict_types=1);

$autoloadPath = getcwd() . '/vendor/autoload.php';
if (file_exists($autoloadPath)) {
	require_once $autoloadPath;
}
