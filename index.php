<?php
echo "The time in " . date_default_timezone_get() . " is " . date("H:i:s") . "<br>";

echo "Hostname pod is: " .  gethostname() . "<br>";

echo phpinfo();
?>

