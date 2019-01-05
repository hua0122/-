<?php
include_once $_SERVER['DOCUMENT_ROOT'] . '/l_wx/config.php';
$url = WEBURL."/api/protect/crontab";
header("location:".$url);

?>