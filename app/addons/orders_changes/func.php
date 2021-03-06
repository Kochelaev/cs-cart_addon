<?php

defined('BOOTSTRAP') or die('Access denied');

function fn_orders_changes_change_order_status_post($order_id, $status_to, $status_from, $force_notification, $place_order)
{

  $user_id = 0;
  if (!empty($_SESSION['auth']['user_id'])) {
    $user_id = intval($_SESSION['auth']['user_id']);
  }

  if (!empty($place_order)) {
    $status_from = NULL;
  }

  $data = [
    'order_id'    => $order_id,
    'status_from' => $status_from,
    'status_to'   => $status_to,
    'user_id'     => $user_id,
    'timestamp'   => TIME,
  ];

  db_query('INSERT INTO ?:orders_changes ?e', $data);
}

function fn_orders_changes_get()
{

  $orders_changes = db_get_array("SELECT * FROM ?:orders_changes ORDER BY changes_id DESC");

  foreach ($orders_changes as $key => $value) {
    $orders_changes[$key]['user_name'] = fn_get_user_name($orders_changes[$key]['user_id']);
  }

  return $orders_changes;
}
