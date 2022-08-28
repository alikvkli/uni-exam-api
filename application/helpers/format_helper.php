<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('data_format_json')) {
    function data_format_json($data)
    {
        return json_encode($data);
    }
}
