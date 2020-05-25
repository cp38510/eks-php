<?php
echo "The time in " . date_default_timezone_get() . " is " . date("H:i:s") . "<br>";

$rand1=rand();
echo "Random number without a range : ". $rand1 . "<br />";

echo phpinfo();
?>

