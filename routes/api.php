<?php

declare(strict_types=1);

require_once __DIR__ . '/../vendor/autoload.php';

use App\TestCopier;

$api = new \DigitalStars\SimpleAPI();

if ($api->module === 'copy') {
    $params = $api->params([
        'id',
        'name',
    ]);
    $copier = new TestCopier;
    $api->answer = $copier((int) $params['id'], $params['name']);
}