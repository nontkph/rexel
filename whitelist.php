<?php

$RequestKey = $_GET["Key"];
$RequestHwid = $_GET["HWID"];

$KeyWhitelist = array(
    "key1" => "some_hwid"
);

if (array_key_exists($RequestKey, $KeyWhitelist) && $KeyWhitelist[$RequestKey] === $RequestHwid) {
    echo "Whitelisted";
} else {
    echo "Invalid Whitelist";
}
?>
