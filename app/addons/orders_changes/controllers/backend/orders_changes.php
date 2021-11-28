<?php

use Tygh\Tygh;

defined('BOOTSTRAP') or die('Access denied');

if ($mode === 'view') {

  $orders_changes = fn_orders_changes_get();
  Tygh::$app['view']->assign('orders_changes', $orders_changes);
}
